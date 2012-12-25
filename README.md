# CouchdbActsAsList

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'couchdb_acts_as_list'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install couchdb_acts_as_list

## Usage

class Locale < CouchRest::Model::Base
  include CouchdbActsAsList
end

## Instance methods

locale.position
locale.insert_at 2

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
