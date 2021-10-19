const gulp = require("gulp");
const newer = require("gulp-newer");
const concat = require('gulp-concat'); // agrupa varios archivos en uno solo
// const terser = require('gulp-terser'); // minifica js, alternativa quizas uglify

const sourcemaps = require('gulp-sourcemaps');
const postcss = require('gulp-postcss');
const cssnano = require('cssnano');
const sass = require("gulp-sass");

var rep = require('gulp-replace-image-src');

const imagemin = require('gulp-imagemin');
var pngquant = require('imagemin-pngquant');
var zopfli = require('imagemin-zopfli');
var mozjpeg = require('imagemin-mozjpeg');
var giflossy = require('imagemin-giflossy');

const browsersync = require("browser-sync").create();

const {src, series, parallel, dest, watch } = require('gulp');

const jsPath = 'src/assets/js/**/*.js';
//const imagesPath = 'src/assets/img/**/*.+(png|jpeg|jpg|gif)';
const imagesPath = 'src/assets/img/**/*.{png,jpeg,jpg,gif,svg}';
const cssPath = 'src/assets/css/**/*.css';
const scssPath = 'src/assets/scss/**/*.scss';
const viewsPath = 'src/views/**/*.html';
const componentsPath = 'src/components/*.html';

function copyViews(){
    return src(viewsPath)
        .pipe(newer('dist/**/*.html'))
        .pipe(rep({
            prependSrc : '/img/',
            keepOrigin : false
        }))
        .pipe(gulp.dest('dist'));
}

function copyComponents(){
    return src(componentsPath).pipe(gulp.dest('dist'));
}

function optimizeImagesTask(){
    var dest = 'dist/img';

    return src(imagesPath)
        .pipe(newer(dest)) // filtra sólo por nuevas imagenes agregadas/modificadas => building (+) rápido
        .pipe(
            imagemin(
                {verbose:true}, // detalla cuales imagenes son las que optimiza
                [
                    pngquant({
                        quality: [0.7, 0.7]
                    }),
                    zopfli({
                        more: true
                    }),
                    mozjpeg({
                        quality: 70,
                        progressive: true
                    }),
                    giflossy({
                        optimizationLevel: 3, optimize: 3, lossy: 2
                    })
                ]
            ))
        .pipe(gulp.dest(dest));
}

function jsTask() {
    return src(['node_modules/jquery/dist/jquery.js',
                'node_modules/bootstrap/dist/js/bootstrap.js',
                jsPath]) // ruta origen de los archivos a copiar
    // pipe actúa como un "then"
        .pipe(newer('dist/assets/js/all.js'))
        .pipe(sourcemaps.init()) //
        .pipe(concat('all.js')) // archivo donde se agruparan todos los js
        // .pipe(terser()) // minificamos
        .pipe(sourcemaps.write('.')) // crea el archivo en la ruta actual
        .pipe(dest('dist/assets/js')); // copiamos el archivo a la ruta destino
}


function cssTask() {
    return src([cssPath, 'node_modules/bootstrap/dist/css/bootstrap.css'])
        .pipe(sourcemaps.init())
        .pipe(concat('style.css'))
        .pipe(postcss([cssnano()])) // minificamos la hoja de estilos
        .pipe(sourcemaps.write('.'))
        .pipe(dest('dist/assets/css'));
}

function scssTask() {
    return src(scssPath)
        .pipe(sourcemaps.init())
        .pipe(sass().on('error', sass.logError))
        .pipe(concat('sass-style.css'))
        .pipe(dest('dist/assets/css'));
}

function browsersyncServe(cb){
    browsersync.init({
        server: {
            baseDir: './dist',
            hostname: "manudocs.local",
            port: 3000
        },
    });
    cb();
}

function browsersyncReload(cb){
    browsersync.reload();
    cb();
}

// al observar cambios en los archivos, ejecutará esas tareas
function watchTask() {
    watch([viewsPath, componentsPath, cssPath, scssPath, jsPath, imagesPath],
          series(parallel(copyViews, copyComponents, cssTask, scssTask, jsTask, optimizeImagesTask), browsersyncReload));
}

// cualquiera de las tareas que exportamos,
// se pueden ejecutar por separado en la terminal con: gulp nombreTarea
exports.optimizeImagesTask = optimizeImagesTask;
exports.copyViews = copyViews;
exports.copyComponents = copyComponents;
exports.jsTask = jsTask;
exports.cssTask = cssTask;
exports.scssTask = scssTask;
// - usamos parallel() para ejecutar múltiples tareas, sin importar el orden
// - usamos series() para ejecutar tareas en un orden específico
exports.default = series(
    // 1. Hará todas estas tareas las hará el paralelo
    parallel(optimizeImagesTask, copyViews, copyComponents, jsTask, cssTask, scssTask),
    // 2. Seguido ejecutará la tarea para el iniciar servidor
    browsersyncServe,
    // 3. Por último la terminal quedará en foreground observando nuevos cambios
    // para ejecutar las tareas
    watchTask
);
