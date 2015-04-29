ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
	html = %(<div class="form__group--error">#{html_tag}</div>).html_safe

	form_fields = %w(textarea input select)

	elements = Nokogiri::HTML::DocumentFragment.parse(html_tag).css 'label, ' + form_fields.join(', ')

	elements.each do |e|
		if e.node_name.eql? 'label'
			html = %(<div class="form__group--error">#{e}</div>).html_safe
		elsif form_fields.include? e.node_name
			if instance.error_message.kind_of?(Array)
				html = %(<div class="form__group--error">#{html_tag}<div class="form__error__message">#{instance.error_message.uniq.join(', ')}</div></div>).html_safe
			else
				html = %(<div class="form__group--error">#{html_tag}<div class="form__error__message">#{instance.error_message}</div></div>).html_safe
			end
		end
	end
	html
end

# Configure custom form builder
ActionView::Base.default_form_builder = Konoma::Base::Web::FormBuilder