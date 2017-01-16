var app = angular.module('app');
app.controller('LoginCtrl',
    ['$scope', '$location',
    function ($scope, $location) {
        $scope.Login = function () {
            $location.path('/Home');
        }
}]);