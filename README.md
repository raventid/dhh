# Dhh

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/dhh`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dhh'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dhh

## Usage

Controllers:

Extend your controller with Dhh::Controller. And you will get the route called https://base_url/controller_name/action_name

``` ruby
class HelloController < Dhh::Controller
  # this will be https://base_url/hello/index
  def index
    render :index, noun: :unicorn
  end
  
  # dump_controller which show rack content
  def env_info
    ar = env.to_s.split(',')
    output = ''
    ar.each do |line|
      output += "#{line.to_s}" + "<br>"
    end
    output
  end
end
```

Views:

To create a view you should follow next rules:

1. In app/views folder create folder with controller name, e.g. HelloController's view folder should have a name app/views/hello/.
2. To bind view to an an action use render method.

Controller:

```ruby
# app/controllers/hello_controller.rb
class HelloController < Dhh::Controller
  def index
    render :index, noun: :unicorn
  end
end
```

View:

```html
# app/views/hello/index.html.erb
<h1>This is my <%= unicorn %></h1>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dhh.

