angular.module('konomaBaseWeb', []).directive("ngCreditCard", [function () {
	return {
		restrict: 'A',
		template: '' +
		'<div class="credit__card">' +
		'   <div class="card__number card__field__container">' +
		'       <label class="card__label">{{ cardNumberLabel }}</label>' +
		'       <div><input class="card__number__number" type="text" placeholder="{{ cardNumberPlaceholder }}" autocomplete="off" pattern="[0-9 ]*" data-stripe="number"></div>' +
		'   </div>' +
		'   <div class="card__info card__info--split">' +
		'       <div class="card__info--expiry card__field__container">' +
		'           <label class="card__label">{{ cardExpiryLabel }}</label>' +
		'           <div class="card__expiry">' +
		'               <input class="card__expiry__month" maxlength="2" type="text" placeholder="{{ cardMonthPlaceholder }}" autocomplete="off" pattern="\\d*" data-stripe="exp-month"> /' +
		'               <input class="card__expiry__year" maxlength="4" type="text" placeholder="{{ cardYearPlaceholder }}" autocomplete="off" pattern="\\d*" data-stripe="exp-year">' +
		'           </div>' +
		'       </div>' +
		'       <div class="card__info--cvc card__field__container">' +
		'           <label class="card__label">{{ cardCvcLabel }}</label>' +
		'		    <div class="card__cvc"><input class="card__cvc__cvc" type="text" placeholder="{{ cardCvcPlaceholder }}" autocomplete="off" pattern="\\d*" data-stripe="cvc"></div>' +
		'       </div>' +
		'   </div>' +
		'</div>',
		scope: {
			cardNumberLabel: '@',
			cardNumberPlaceholder: '@',
			cardExpiryLabel: '@',
			cardMonthPlaceholder: '@',
			cardYearPlaceholder: '@',
			cardCvcLabel: '@',
			cardCvcPlaceholder: '@'
		},
		link: function (scope, element) {
			var handleCardType = function (element, cardType) {
				$(element).removeClass('credit__card--mastercard');
				$(element).removeClass('credit__card--amex');
				$(element).removeClass('credit__card--visa');

				if (cardType === 'visa' || cardType === 'mastercard' || cardType === 'amex') {
					$(element).addClass('credit__card--' + cardType);
				}
			};

			var cardNumberInputField = $(element).find('.card__number__number');
			cardNumberInputField.payment('formatCardNumber');
			cardNumberInputField.on('propertychange change click keyup input paste', function () {
				handleCardType($(this).parents('.credit__card'), $.payment.cardType($(this).val()));
			});

			$(element).find('.card__cvc__cvc').payment('formatCardCVC');
			$(element).find('.card__expiry__month').payment('restrictNumeric');
			$(element).find('.card__expiry__year').payment('restrictNumeric');
		}
	}
}]);