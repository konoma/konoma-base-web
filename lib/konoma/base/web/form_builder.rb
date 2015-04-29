module Konoma
	module Base
		module Web
			class FormBuilder < ActionView::Helpers::FormBuilder
				include ActionView::Helpers::TagHelper
				include ActionView::Context

				def select(method, choices = nil, options = {}, html_options = {}, &block)
					html_options.merge!('ng-select-placeholder' => true)

					super(method, choices, options, html_options, &block)
				end

				def collection_check_boxes(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
					super(method, collection, value_method, text_method, options, html_options) do |b|
						content_tag(:div, class: 'group__checkbox') do
							b.check_box +
							b.label
						end
					end
				end
			end
		end
	end
end