const gulp = require("gulp");
const concat = require('gulp-concat'); // agrupa varios archivos en uno solo
const terser = require('gulp-terser'); // minifica js, alternativa quizas uglify
const sourcemaps = require('gulp-sourcemaps');
const postcss = require('gulp-postcss');
const cssnano = require('cssnano');

const sass = require("gulp-sass");
const browsersync = require("browser-sync").create();

const {src, series, parallel, dest, watch } = require('gulp');

const jsPath = 'src/assets/js/**/*.js';
const cssPath = 'src/assets/css/**/*.css';
const scssPath = 'src/assets/scss/**/*.scss';

function copyHtml(){
  return src('src/*.html').pipe(gulp.dest('dist'));
}

function jsTask() {
    return src(jsPath) // ruta origen de los archivos a copiar
    // pipe actúa como un "then"
        .pipe(sourcemaps.init()) //
        .pipe(concat('all.js')) // archivo donde se agruparan todos los js
        .pipe(terser()) // minificamos
        .pipe(sourcemaps.write('.')) // crea el archivo en la ruta actual
        .pipe(dest('dist/assets/js')); // copiamos el archivo a la ruta destino
}


function cssTask() {
    return src(cssPath)
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
    watch('*.html', browsersyncReload);
    watch([cssPath, scssPath, jsPath],{ interval: 1000 }, parallel(cssTask, scssTask, jsTask, browsersyncReload));
}

// cualquiera de las tareas que exportamos,
// se pueden ejecutar por separado en la terminal con: gulp nombreTarea
exports.copyHtml = copyHtml;
exports.jsTask = jsTask;
exports.cssTask = cssTask;
exports.scssTask = scssTask;
// usamos parallel para multiples tareas
exports.default = series(
    parallel(copyHtml, jsTask, cssTask, scssTask),
    // parallel(copyHtml, jsTask, mergeCssTask),
    // se quedará la terminal ejecutandose y observando cambios en los archivos
    browsersyncServe,
    watchTask
);
