var app = angular.module('app', ['ngRoute']);

app.config(function ($routeProvider, $compileProvider) {
    $routeProvider.when('/', {
        templateUrl: 'Templates/Login.html',
        controller: 'LoginCtrl'
    }).when('/Home', {
        templateUrl: 'Templates/Home.html'
    }).when('/Category', {
        templateUrl: 'Templates/Category.html',
        controller: 'CategoryCtrl'
    });
});