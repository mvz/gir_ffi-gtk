# frozen_string_literal: true

require "test_helper"

describe Gtk::TreeStore do
  describe ".new" do
    it "takes an array of column types" do
      store = Gtk::TreeStore.new([GObject::TYPE_STRING, GObject::TYPE_INT])
      _(store).must_be_instance_of Gtk::TreeStore
    end
  end

  describe "#insert_with_values" do
    it "inserts a row with the given values" do
      store = Gtk::TreeStore.new([GObject::TYPE_STRING, GObject::TYPE_INT])
      row = store.insert_with_values(nil, 0, [0, 1], ["foo", 42])
      _(store.get_value(row, 0)).must_equal "foo"
      _(store.get_value(row, 1)).must_equal 42
    end
  end

  describe "#set" do
    it "updates a row with the given values" do
      store = Gtk::TreeStore.new([GObject::TYPE_STRING, GObject::TYPE_INT])
      row = store.insert_with_values(nil, 0, [0, 1], ["foo", 42])
      store.set(row, [1, 0], [3, "bar"])
      _(store.get_value(row, 0)).must_equal "bar"
      _(store.get_value(row, 1)).must_equal 3
    end
  end

  describe "#set_value" do
    it "allows setting a value to nil" do
      store = Gtk::TreeStore.new([GObject::TYPE_STRING, GObject::TYPE_INT])
      row = store.insert_with_values(nil, 0, [0, 1], ["foo", 42])
      store.set_value(row, 0, nil)
      _(store.get_value(row, 0)).must_be_nil
    end
  end
end
