const gulp = require("gulp");
const concat = require('gulp-concat'); // agrupa varios archivos en uno solo
const terser = require('gulp-terser'); // minifica js
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
    watch([cssPath, jsPath],{ interval: 1000 }, parallel(cssTask, jsTask));
}

exports.copyHtml = copyHtml;
exports.jsTask = jsTask;
exports.cssTask = cssTask;
// usamos parallel para multiples tareas
// exports.default = parallel(copyHtml, jsTask, cssTask);
exports.default = series(
    parallel(copyHtml, jsTask, cssTask),
    // se quedará la terminal ejecutandose y observando cambios en los archivos
    browsersyncServe,
    watchTask
);
