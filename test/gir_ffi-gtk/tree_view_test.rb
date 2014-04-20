require 'test_helper'

describe Gtk::TreeView do
  describe ".new" do
    it "accepts no arguments" do
      result = Gtk::TreeView.new
      result.must_be_instance_of Gtk::TreeView
    end

    it "accepts store as argument" do
      result = Gtk::TreeView.new(Gtk::TreeStore.new)
      result.must_be_instance_of Gtk::TreeView
      result.get_model.must_be_instance_of Gtk::TreeStore
    end
  end
end
