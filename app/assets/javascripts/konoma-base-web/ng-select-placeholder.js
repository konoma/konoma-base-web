angular.module('konomaBaseWeb', []).directive("ngSelectPlaceholder", [function () {
	return {
		restrict: 'A',
		link: function (scope, element) {
			var className = 'select__no-value';

			var handleSelectValue = function (element) {
				if (element.val() !== '') {
					element.removeClass(className);
				} else {
					element.addClass(className);
				}
			};

			handleSelectValue($(element));

			$(element).change(function () {
				handleSelectValue($(this));
			});
		}
	}
}]);