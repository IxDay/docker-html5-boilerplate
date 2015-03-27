var gulp = require('gulp');
var server = require('gulp-server-livereload');

var mounted_dir = '/mnt';

gulp.task('default', function() {
  console.log('hello world');
});

gulp.task('init', function() {
  gulp.src('initializr/**')
    .pipe(gulp.dest(mounted_dir));
});

gulp.task('serve', function () {
  gulp.src(mounted_dir)
    .pipe(server({
      livereload: true,
      host: '0.0.0.0',
      port: 8000
    }));
});
