var app = angular.module("myApp", ['ngRoute']);
app.controller("map_ctrl", function($scope, $http, $location) {
	//配置  
	$scope.count = 0; //数据库中条目数
	$scope.p_pernum = 10; //每页条目数
	//变量  
	$scope.p_current = 1; // current ：当前页码
	$scope.p_all_page = 0; //总页数
	$scope.pages = [];
	//初始化第一页  
	alert(1);
	//获取数据  
	var _get = function(page, size, callback) {
		//var userid="%"+$scope.userid+"%";
		var articleType = "%" + $scope.articleType + "%";
		//var queryParamUserName="%"+$scope.user+"%";
		var queryparamArticleTitle = "%" + $scope.ArticleTitle + "%";
		var queryParamArticleContent = "%" + $scope.ArticleContent + "%";
		var url = "";
		$http.get("http://localhost:8080/Blog/article/selectPageUseDyc.action?page=" + page + "&size=" + size).success(function(res) {
			if(res && res.status == 1) {
				console.log(res);
				$scope.count = res.total;
				$scope.list = res.rows;
				$scope.p_current = page;
				$scope.p_all_page = Math.ceil($scope.count / $scope.p_pernum);
				reloadPno();
				callback();
			} else {
				alert("加载失败");
			}
		});
	}
	_get($scope.p_current, $scope.p_pernum, function() {
		alert("我是第一次加载");

	});

	//单选按钮选中  
	$scope.select = function(id) {
			alert(id);
		}
		//首页  
	$scope.p_index = function() {
			$scope.load_page(1);
		}
		//尾页  
	$scope.p_last = function() {
			$scope.load_page($scope.p_all_page);
		}
		//加载某一页  
	$scope.load_page = function(page) {
		_get(page, $scope.p_pernum, function() {});
	};
	//初始化页码  
	var reloadPno = function() {
		$scope.pages = calculateIndexes($scope.p_current, $scope.p_all_page, 8);
	};
	//分页算法  
	var calculateIndexes = function(current, length, displayLength) {
		var indexes = [];
		var start = Math.round(current - displayLength / 2);
		var end = Math.round(current + displayLength / 2);
		if(start <= 1) {
			start = 1;
			end = start + displayLength - 1;
			if(end >= length - 1) {
				end = length - 1;
			}
		}
		if(end >= length - 1) {
			end = length;
			start = end - displayLength + 1;
			if(start <= 1) {
				start = 1;
			}
		}
		for(var i = start; i <= end; i++) {
			indexes.push(i);
		}
		return indexes;
	};

});
app.filter('characters', function () {
        return function (input, chars, breakOnWord) {
            if (isNaN(chars)) return input;
            if (chars <= 0) return '';
            if (input && input.length >= chars) {
                input = input.substring(0, chars);

                if (!breakOnWord) {
                    var lastspace = input.lastIndexOf(' ');
                    //get last space
                    if (lastspace !== -1) {
                        input = input.substr(0, lastspace);
                    }
                }else{
                    while(input.charAt(input.length-1) == ' '){
                        input = input.substr(0, input.length -1);
                    }
                }
                return input + '...';
            }
            return input;
        };
    })
    .filter('words', function () {
        return function (input, words) {
            if (isNaN(words)) return input;
            if (words <= 0) return '';
            if (input) {
                var inputWords = input.split(/\s+/);
                if (inputWords.length > words) {
                    input = inputWords.slice(0, words).join(' ') + '...';
                }
            }
            return input;
        };
    });

