angular.module('myApp', [])

    .filter('cityFilter', function () {
        return function (data, parent) {
            var filterData = [];
            angular.forEach(data, function (obj) {
                if (obj.parent === parent) {
                    filterData.push(obj);
                }
            })

            return filterData;
        }
    })

    .directive('even',function(){
        return {
            require : 'ngModel',
            link:function(scope,elm,attrs,ngModelController){
                ngModelController.$parsers.push(function(viewValue){
                    if(viewValue % 2 === 0){
                        ngModelController.$setValidity('even',true);
                    }else{
                        ngModelController.$setValidity('even',false);
                    }
                    return viewValue;
                });

//                ngModelController.$formatters.push(function(modelValue){
//                    return modelValue + 'kittencup';
//                })
            }
        };
    })

    .directive('customTextArea',function(){
        return {
            restrict:'E',
            template:'<div contenteditable="true"></div>',
            replace:true,
            require : 'ngModel',
            link:function(scope,elm,attrs,ngModelController){


                // view->model
                elm.on('keyup',function(){
                    scope.$apply(function(){
                        ngModelController.$setViewValue(elm.html());
                    });
                })

                ngModelController.$render = function(){
                    elm.html(ngModelController.$viewValue);
                }

            }
        };
    })


    .controller('firstController', ['$scope', function ($scope) {

        var that = this;

        

        


        // 先保留一份默认值
        $scope.origData = angular.copy($scope.data);

        $scope.reset = function(){

            $scope.data = angular.copy($scope.origData);
            that.initCity();
            $scope.myForm.$setPristine();
        }

        
       

        $scope.toggleHobbySelection = function (id) {

            var index = -1;
            if ($scope.data.hobbies === undefined) {
                $scope.data.hobbies = [];
            } else {
                index = $scope.data.hobbies.indexOf(id);
            }

            if (index === -1) {
                $scope.data.hobbies.push(id);
            } else {
                $scope.data.hobbies.splice(index, 1);
            }

        }
    }]);
