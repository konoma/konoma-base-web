module Konoma
	module Base
		module Web
			class FormBuilder < ActionView::Helpers::FormBuilder
				def select(method, choices = nil, options = {}, html_options = {}, &block)
					html_options.merge!('ng-select-placeholder' => true)

					super(method, choices, options, html_options, &block)
				end
			end
		end
	end
end