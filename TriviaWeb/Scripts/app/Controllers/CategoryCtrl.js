var app = angular.module('app')
app.controller('CategoryCtrl', ['$scope', 'CategoryService',
function ($scope, CategoryService) {
    //------------- Declaracion de Variables------------------//
    $scope.update = false;
    $scope.category = [];
    $scope.categoryDetail = {};
    $scope.categoryInsert = {
        Id: 0,
        Name: '',
        Description: '',
        stateInsert: 'Pendiente',
        styleInsert: 'info'
    };
    //Variables Tabla Dinamica
    $scope.pageNumber = 0;
    $scope.pageSizes = [5, 10, 15, 20];
    $scope.pageSize = $scope.pageSizes[0];
    $scope.currentPage = 0;
    $scope.numberElements = 0;
    //Inicializando Variables Carga de Datos
    $scope.GetCategory = function () {
        $scope.category = [];
        var category = CategoryService.GetCategory();
        category.then(function (auxCategory) {
            auxCategory.forEach(function (item) {
                item.stateUpdate = false;
                item.stateUpdateMessage = 'Pendiente';
                item.styleUpdateMessage = 'info';
                $scope.category.push(item);
            }, this);
            //Ajustando los valores de la tabla
            $scope.numberElements = $scope.category.length;
            $scope.pageNumber = Math.ceil($scope.category.length / $scope.pageSize);
        }, function (error) { });
    };
    $scope.GetCategory();
    //Funcion carga detalles categorya
    $scope.loadCategory = function (category) {
        $scope.categoryDetail = category;
    };
    //Funcion Actualizar
    $scope.updateCategory = function (category) {
        var updateCategory = CategoryService.updateCategory(category);
        updateCategory.then(function (data) {
            category.stateUpdateMessage = 'Completado';
            category.styleUpdateMessage = 'success';
        });
    };
    //Funcion Insertar
    $scope.InsertCategory = function (category) {
        $scope.categoryInsert.stateInsert = 'Procesando';
        $scope.categoryInsert.styleInsert = 'warning';
        var InsertCategory = CategoryService.InsertCategory(category);
        InsertCategory.then(function (data) {
            $scope.GetCategory();
            $scope.categoryInsert.stateInsert = 'Completado';
            $scope.categoryInsert.styleInsert = 'success';
        });
    };
    //Funcion eliminar
    $scope.deleteCategory = function (category) {
        var deleteCategory = CategoryService.deleteCategory(category);
        deleteCategory.then(function (data) {
            $scope.GetCategory();
        });
    };
    // Funciones tabla dinamica
    // Funcion para ordenar los elementos de una Tabla
    $scope.ordering = function (ordVar, by) {
        ordVar = !ordVar;
        $scope.ordStatus = ordVar;
        $scope.ord = by;
        $scope.currentPage = 0;
        return ordVar;
    };
    // Funcion para paginar
    $scope.paging = function (type) {
        if (type === 0 && ($scope.currentPage > 0)) {
            --$scope.currentPage;
        } else if (type === 1 && $scope.currentPage < $scope.pageNumber - 1) {
            ++$scope.currentPage;
        }
    };
    // Funcion para Buscar
    $scope.search = function (item) {
        if ($scope.searchComplete === undefined) {
            return true;
        }
        else {
            if (String(item.id).indexOf($scope.searchComplete.toLowerCase()) !== -1 ||
            item.firstName.toLowerCase().indexOf($scope.searchComplete.toLowerCase()) !== -1 ||
            item.lastName.toLowerCase().indexOf($scope.searchComplete.toLowerCase()) !== -1 ||
            item.cedula.toLowerCase().indexOf($scope.searchComplete.toLowerCase()) !== -1) {
                return true;
            }
        }
        return false;
    };
    // Para que el numero de paginas se ajuste a la paginacion
    $scope.changeAction = function () {
        $scope.currentPage = 0;
        $scope.pageNumber = Math.ceil($scope.result.length / $scope.pageSize);
    }
    // Funcion para el Estado Insert
    $scope.CleanCategoryInsert = function () {
        $scope.categoryInsert = {
            Id: 0,
            Name: '',
            Description: '',
            stateInsert: 'Pendiente',
            styleInsert: 'info'
        };
    };
    // Funcion para el Estado Update
    $scope.CleanCategoryUpdate = function (category) {
        category.stateUpdate = false;
        if (category.stateUpdateMessage === 'Completado') {
            category.stateUpdateMessage = 'Pendiente';
            category.styleUpdateMessage = 'info'
        }
    };
    // Funcion para cambiar el stado a procesando en update
    $scope.changeStateUpdate = function (category) {
        category.stateUpdateMessage = 'Procesando';
        category.styleUpdateMessage = 'warning';
    };
}]);