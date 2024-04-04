# Almapi

This gem is used to handle Alma'a API call.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add almapi

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install almapi

## Usage

Almapi provides an Alampi module which contains the Api class. 

An Api class object is created with two mandatory information: an key for Alma's API and a base URI for Alma's API.

The Api class is providing the following methods:
* delete: to handle DELETE method calls. Needs two mandatory parameters: resource and data
* get: to handle GET method calls. Needs two mandatory parameters: resource and resumption_token
* post: to handle PSOT method calls. Needs two mandatory parameters: resource and data
* put: to handle PUT method calls. Needs two mandatory parameters: resource and data

Here is a description of each parameter mentionned above:
* resource: it is the part that completes the base uri to create a complete Alma's API call, with the various ids and necessary parameters but without the apikey parameter that will be added automatically. 
* data: the XML data needed by the called resource and method.
* resumption_token: is parameter is not mandatory and is used only for analytics calls.

## Documentation

Documentation is provided in `doc` folder (use `yard`).

## Development

Put your Ruby code in the file `lib/almapi`. To experiment with that code, run `bin/console` for an interactive prompt.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests (see below). You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Testing

Tested using `rspec`. 

In spec directory, define a `almapi_spec_init.rb` with two string constants : APIKEY and URIBASE, giving an api key value and a uri base value.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jszenb/almapi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jszenb/almapi/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Almapi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jszenb/almapi/blob/master/CODE_OF_CONDUCT.md).
