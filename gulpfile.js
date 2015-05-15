var gulp = require('gulp');
var coffee = require('gulp-coffee');
var coffeex = require('gulp-coffee-react');
var concat = require('gulp-concat');
var del = require('del');
var less = require('gulp-less');
var merge = require('merge2');
var path = require('path');
var plumber = require('gulp-plumber');
var sourcemaps = require('gulp-sourcemaps');

var paths = {
	html: ['client/src/**/*.html'],
	styles: ['client/src/**/*.less'],
	scripts: [
		'client/src/**/*.coffee',
		'client/src/**/*.cjsx'
	],
	vendor: ['client/vendor/**/*.*'],
	assets: ['client/assets/**/*.*']
};

//------------------------------------------------------------------------------

gulp.task('clean', function(cb) {
	del(['build'], cb);
});

gulp.task('assets', ['clean'], function() {
	return gulp.src(paths.assets)
		.pipe(plumber())
		.pipe(gulp.dest('build'));
});

gulp.task('vendor', ['clean'], function() {
	return gulp.src(paths.vendor)
		.pipe(plumber())
		.pipe(gulp.dest('build/vendor'));
});

gulp.task('html', ['clean'], function () {
	return gulp.src(paths.html)
		.pipe(plumber())
		.pipe(gulp.dest('build'));
});

gulp.task('styles', ['clean'], function () {
	return gulp.src(paths.styles)
		.pipe(plumber())
		.pipe(less({
			paths: [
				'client/src'
			]
		}))
		.pipe(concat('main.css'))
		.pipe(gulp.dest('build/styles'));
});

gulp.task('scripts', ['clean'], function() {
	var vendorResult = gulp.src(paths.vendor)
		.pipe(plumber())
		.pipe(gulp.dest('build/vendor'));

	var coffeeResult = gulp.src(paths.scripts)
		.pipe(plumber())
		.pipe(sourcemaps.init())
		.pipe(coffeex({bare: true}))
		.pipe(sourcemaps.write())
		.pipe(gulp.dest('build/js'))

	return merge([
		vendorResult,
		coffeeResult
	]);
});

gulp.task('watch', function() {
	gulp.watch(paths.scripts, ['build']);
	gulp.watch(paths.html, ['build']);
	gulp.watch(paths.vendor, ['build']);
	gulp.watch(paths.styles, ['build']);
	gulp.watch(paths.assets, ['build']);
});

gulp.task('build', ['clean', 'scripts', 'styles', 'vendor', 'assets', 'html']);
gulp.task('default', ['build', 'watch']);