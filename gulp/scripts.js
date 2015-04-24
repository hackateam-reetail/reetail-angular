'use strict';

var gulp = require('gulp');
var browserSync = require('browser-sync');

var $ = require('gulp-load-plugins')();
//var gulpLiveScript = require('gulp-livescript');


module.exports = function(options) {
  gulp.task('scripts', function () {
    return gulp.src(options.src + '/app/**/*.ls')
    //  .pipe($.sourcemaps.init())
      .pipe($.livescript({bare: true}).on('error', options.errorHandler('LiveScript')))
      //.pipe($.sourcemaps.write())
      .pipe(gulp.dest(options.tmp + '/serve/app'))
      .pipe(browserSync.reload({ stream: true }))
      .pipe($.size());
  });
};
