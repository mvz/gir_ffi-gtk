require 'test_helper'

describe Gtk::ListStore do
  describe '.new' do
    it 'takes an array of column types' do
      store = Gtk::ListStore.new([GObject::TYPE_STRING, GObject::TYPE_INT])
      store.must_be_instance_of Gtk::ListStore
    end
  end

  describe '#insert_with_values' do
    it 'inserts a row with the given values' do
      store = Gtk::ListStore.new([GObject::TYPE_STRING, GObject::TYPE_INT])
      row = store.insert_with_values(0, [0, 1], ['foo', 42])
      store.get_value(row, 0).get_value.must_equal 'foo'
      store.get_value(row, 1).get_value.must_equal 42
    end
  end
end
