var fs    = require('fs');
var path  = require('path');
var merge = require('merge-stream');

var gulp   = require('gulp');
var gutil  = require('gulp-util');
var shell  = require('gulp-shell');
var tap    = require('gulp-tap');
var clean  = require('gulp-rimraf');

var config = require('./build_settings');

var addons = path.resolve('./addons');
var release = path.resolve('./release');

// Let NodeJS know a lot is being run simultanious
// TODO: Find vay to fix possible leak
process.stdout.setMaxListeners(0)
process.stdin.setMaxListeners(0)

/* run the watch task when gulp is called without arguments */
gulp.task('default', ['build-dev']);

/**
 * Build release
 */
gulp.task('build', function() {

});

gulp.task('build-clean', function() {

});

/**
 * Build development
 */
gulp.task('build-dev', ['build-dev-clean'], function() {
    var folders = fs.readdirSync(addons)
      .filter(function(file){
          return fs.statSync(path.join(addons, file)).isDirectory();
      });

    var tasks = folders.map(function(folder) {
        return gulp.src(path.join(addons, folder))
            .pipe(
                shell('makepbo -NUP -@=' + config.mainPrefix +'\\' + config.prefix +
                        '\\addons\\' + folder + ' <%= file.path %> ' +
                        path.join(addons, config.prefix + '_' + folder + '.pbo'), { quiet: true })
            )
            .pipe(
                tap(function(t) {
                    gutil.log('Finished building ' + gutil.colors.cyan(folder), "=>", gutil.colors.cyan(config.prefix + '_' + folder + '.pbo'));
                })
            );
    });

    return merge(tasks);
});

gulp.task('build-dev-clean', function() {
    return gulp.src('addons/*.pbo')
            .pipe(clean());
});

/**
 * Setup development environment
 */
gulp.task('setup', function() {

};
