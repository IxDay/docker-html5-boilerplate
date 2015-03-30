var gulp = require('gulp');
var connect = require('gulp-connect');
var exec = require('child_process').execSync;

var mounted_dir = '/mnt';
var mounted_dir_files = mounted_dir + '/**';

// workaround for https://github.com/joyent/node/issues/9029
var ip_command = 'ip addr show eth0 | ' +
    'awk \'$2 ~/172\.17/ { gsub(/\\/.*/, "", $2); print $2 }\'';
var ip_address = exec(ip_command);

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
      host: ip_address,
      port: 8000
    });
});
