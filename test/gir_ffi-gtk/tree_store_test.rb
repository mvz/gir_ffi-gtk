require 'test_helper'

describe Gtk::TreeStore do
  describe ".new" do
    it "defaults to toplevel" do
      result = Gtk::TreeStore.new
      result.must_be_instance_of Gtk::TreeStore
    end

    it "accepts window type as symbol" do
      result = Gtk::TreeStore.new(String,Integer)
      result.must_be_instance_of Gtk::TreeStore
      # TODO: implement getters
    end
  end

  describe "column types" do
    it "should accept ruby types as column types" do
      result = Gtk::TreeStore.new
      result.column_types = [String,Integer]
      # TODO: implement getters
    end
  end

  describe "append" do
    it "should append on root" do
      result = Gtk::TreeStore.new
      iter = result.append
      iter.must_be_instance_of Gtk::TreeIter
      # TODO: implement getters
    end
  end

  describe "type mapping" do
    it "should map variadic arguments" do
      gtypes = Gtk::TreeStore.type_mapped_types(String,Integer)
      assert_equal [GObject::TYPE_STRING,GObject::TYPE_INT],gtypes
    end
    it "should map array" do
      gtypes = Gtk::TreeStore.type_mapped_types([String,Integer])
      assert_equal [GObject::TYPE_STRING,GObject::TYPE_INT],gtypes
    end
  end
end
