# konoma-base-web

Base utilities (JavaScript and SCSS).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'konoma-base-web'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install konoma-base-web

## Usage

### Form Components

To use the form components, one must include the mixins, which are available within the _form.scss. The form-components mixin takes three special parameters:

| Parameter | Description |
| --------- | ----------- |
| $checkbox-checked-url | An image for a checked checkbox. Size: 60px x 60px |
| $checkbox-unchecked-url | An image for an unchecked checkbox. Size: 60px x 60px |
| $drop-down-url | An image for the select button. Size: 114px x 114px |

After including the form-components mixin, one must use the following HTML/CSS structure:

```html
<form>
    <div class="form__group">
        <div><label for="foo">foo</label></div>
        <div><input type="text" name="foo"></div>
    </div>

    <!-- The small-bottom-margin class must be used, if there is no label between the previous input and this one -->
    <div class="form__group form__group--small-bottom-margin">
        <div><input type="text"></div>
    </div>

    <!-- Use the following construct for checkboxes -->
    <div class="form__group">
        <label class="label--checkbox" for="bar"><input type="checkbox" name="bar" value="" checked="checked"> Foo Bar.</label>
    </div>

    <!-- To use the button classes, one must include the _button.scss -->
    <div>
        <input type="submit" value="Save" class="button button--save">
    </div>
</form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/konoma/konoma-base-web/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
