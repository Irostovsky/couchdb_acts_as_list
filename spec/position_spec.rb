require 'spec_helper'

describe CouchdbActsAsList do
  class Locale < CouchRest::Model::Base
    use_database COUCH
    include CouchdbActsAsList
  end

  describe "position" do
    it "should create with right value" do
      ru = Locale.create
      en = Locale.create
      ru.position.should == 1
      en.position.should == 2
    end

    it "should reorder after destroy" do
      ru = Locale.create
      en = Locale.create
      su = Locale.create
      en.destroy
      ru.reload.position.should == 1
      su.reload.position.should == 2

      ru.destroy
      su.reload.position.should == 1
    end
  end

  describe "#insert_at" do
    it "should insert to correct position" do
      ru = Locale.create
      en = Locale.create
      su = Locale.create
      fu = Locale.create

      fu.insert_at 2
      Locale.by_position.all.map(&:position).should == [1,2,3,4]
      Locale.by_position.all.map(&:id).should == [ru, fu, en, su].map(&:id)
    end

    it "should insert to correct position" do
      ru = Locale.create
      en = Locale.create
      su = Locale.create
      fu = Locale.create

      fu.insert_at 2
      Locale.by_position.all.map(&:position).should == [1,2,3,4]
      Locale.by_position.all.map(&:id).should == [ru, fu, en, su].map(&:id)
    end

    it "should insert to correct position if position is less than 1" do
      ru = Locale.create
      en = Locale.create
      su = Locale.create
      fu = Locale.create

      su.insert_at 0
      Locale.by_position.all.map(&:position).should == [1,2,3,4]
      Locale.by_position.all.map(&:id).should == [su, ru, en, fu].map(&:id)
    end

    it "should insert to correct position if position is more than count of elements" do
      ru = Locale.create
      en = Locale.create
      su = Locale.create
      fu = Locale.create

      ru.insert_at 10
      Locale.by_position.all.map(&:position).should == [1,2,3,4]
      Locale.by_position.all.map(&:id).should == [en, su, fu, ru].map(&:id)
    end
  end

end