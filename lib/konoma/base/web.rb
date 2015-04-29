require 'konoma/base/web/version'

module Konoma
	module Base
		module Web
			class Engine < Rails::Engine
			end
		end
	end
end

require 'konoma/base/web/form_builder' if defined?(Rails)