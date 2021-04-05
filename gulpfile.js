const gulp = require("gulp");
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
const imagesPath = 'src/assets/img/**/*.{png,jpeg,jpg,gif}';
const cssPath = 'src/assets/css/**/*.css';
const scssPath = 'src/assets/scss/**/*.scss';
const viewsPath = 'src/views/**/*.html';
const componentsPath = 'src/components/*.html';

function copyViews(){
    return src(viewsPath)
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
    return src(imagesPath)
        .pipe(imagemin([
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
        ]))
        .pipe(gulp.dest('dist/img'));
}

function jsTask() {
    return src(['node_modules/jquery/dist/jquery.js',
                'node_modules/bootstrap/dist/js/bootstrap.js',
                jsPath]) // ruta origen de los archivos a copiar
    // pipe actúa como un "then"
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
        server: { baseDir: './dist'}
    });
    cb();
}

function browsersyncReload(cb){
    browsersync.reload();
    cb();
}

// al observar cambios en los archivos, ejecutará esas tareas
function watchTask() {
    // watch('*.html', browsersyncReload);
    watch([viewsPath, componentsPath, cssPath, scssPath, jsPath],
          parallel(copyViews, copyComponents, cssTask,
                   scssTask, jsTask, browsersyncReload));
}

// cualquiera de las tareas que exportamos,
// se pueden ejecutar por separado en la terminal con: gulp nombreTarea
exports.optimizeImagesTask = optimizeImagesTask;
exports.copyViews = copyViews;
exports.copyComponents = copyComponents;
exports.jsTask = jsTask;
exports.cssTask = cssTask;
exports.scssTask = scssTask;
// usamos parallel para multiples tareas
exports.default = series(
    parallel(optimizeImagesTask, copyViews, copyComponents, jsTask, cssTask, scssTask),
    // parallel(copyHtml, jsTask, mergeCssTask),
    // se quedará la terminal ejecutandose y observando cambios en los archivos
    browsersyncServe,
    watchTask
);
