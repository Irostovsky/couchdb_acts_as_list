require 'rubygems'
require 'bundler/setup'

require 'couchdb_acts_as_list'
require 'couchrest_model'

unless defined?(COUCH)
  COUCH_URL = "http://127.0.0.1:5984"
  COUCH_NAME = 'couchrest-test'

  COUCH = CouchRest.database!("#{COUCH_URL}/#{COUCH_NAME}")
end

def reset_test_db!
  COUCH.recreate! rescue nil
  COUCH
end

RSpec.configure do |config|
  config.before(:each) {
    reset_test_db!
  }

  config.after(:all) do
    COUCH.delete!
  end
end