var personService = angular.module('app');
personService.service('CategoryService', ['$http', '$q', 'globalVar',
function ($http, $q, globalVar) {
    this.GetCategory = function () {
        var defered = $q.defer();
        var promise = defered.promise;
        $http.get(globalVar.webApiUrl+'Category/GetCategory').success(function (data, status, headers, config) {
            defered.resolve(data); 
        }).error(function (data, status, headers, config) {
            if (status === 400) {
                defered.reject(data);
            } else {
                throw new Error("Fallo obtener los datos:" + status + "\n" + data);
            }
        });
        return promise;
    };
    this.updatePerson = function (person) {
        var defered = $q.defer();
        var promise = defered.promise;
        $http.post(globalVar.webApiUrl + 'person/updateperson', person).success(function (data, status, headers, config) {
            defered.resolve(data);
        }).error(function (data, status, headers, config) {
            if (status === 400) {
                defered.reject(data);
            } else {
                throw new Error("Fallo obtener los datos:" + status + "\n" + data);
            }
        });
        return promise;
    };
    this.InsertCategory = function (category) {
        var defered = $q.defer();
        var promise = defered.promise;
        $http.post(globalVar.webApiUrl + 'Category/InsertCategory', category).success(function (data, status, headers, config) {
            defered.resolve(data);
        }).error(function (data, status, headers, config) {
            if (status === 400) {
                defered.reject(data);
            } else {
                throw new Error("Fallo obtener los datos:" + status + "\n" + data);
            }
        });
        return promise;
    };
    this.deletePerson = function (person) {
        var defered = $q.defer();
        var promise = defered.promise;
        $http.post(globalVar.webApiUrl + 'person/deleteperson', person).success(function (data, status, headers, config) {
            defered.resolve(data);
        }).error(function (data, status, headers, config) {
            if (status === 400) {
                defered.reject(data);
            } else {
                throw new Error("Fallo obtener los datos:" + status + "\n" + data);
            }
        });
        return promise;
    };
}]);