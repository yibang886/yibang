var gulp        = require("gulp");
var sass        = require("gulp-ruby-sass");
var filter      = require('gulp-filter');
var browserSync = require("browser-sync");
var gutil       = require('gulp-util');
// Start the server
gulp.task('browser-sync', function() {
	browserSync({
		files:[
	      './**/*.html',
	      './**/*.shtml',
	      './**/*.css',
	      './**/*.js'
		],
		logLevel: "debug",
	    startPath:"modify_info.html",
	    proxy: 'loc.test.com:80',
	    port: 8081,
	    browser: "google chrome"		
	});
});
// 默认任务
gulp.task('default', function(){
    gulp.run('browser-sync');
});