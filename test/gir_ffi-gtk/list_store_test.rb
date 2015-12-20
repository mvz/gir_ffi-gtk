require 'test_helper'

describe Gtk::ListStore do
  describe '.new' do
    it 'takes an array of column types' do
      store = Gtk::ListStore.new([GObject::TYPE_STRING, GObject::TYPE_INT])
      store.must_be_instance_of Gtk::ListStore
    end
  end
end
