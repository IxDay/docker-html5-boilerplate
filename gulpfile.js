var gulp = require('gulp');
var connect = require('gulp-connect');
var ip = require('ip');

var mounted_dir = '/mnt';
var mounted_dir_files = mounted_dir + '/**';

gulp.task('default', function () {
  console.log('hello world');
});

gulp.task('init', function () {
  gulp.src('initializr/**')
    .pipe(gulp.dest(mounted_dir));
});

gulp.task('watch', function () {
  gulp.watch(mounted_dir_files, ['reload']);
});

gulp.task('reload', function () {
  gulp.src(mounted_dir_files).pipe(connect.reload());
});

gulp.task('serve', ['watch'], function () {
    connect.server({
      root: mounted_dir,
      livereload: true,
      host: ip.address(),
      port: 8000
    });
});
