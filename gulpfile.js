var gulp = require('gulp'),
    coffee = require('gulp-coffee');

gulp.task('default', function() {
  gulp.src('smooth-tocer.coffee')
    .pipe(coffee())
    .pipe(gulp.dest('./'))
});
