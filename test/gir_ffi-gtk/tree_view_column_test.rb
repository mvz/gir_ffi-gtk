require 'test_helper'

describe Gtk::TreeViewColumn do
  describe ".new" do
    it "accepts no arguments" do
      result = Gtk::TreeViewColumn.new
      result.must_be_instance_of Gtk::TreeViewColumn
    end

    it "accepts title" do
      renderer = Gtk::CellRendererText.new
      result = Gtk::TreeViewColumn.new("a title")
      result.must_be_instance_of Gtk::TreeViewColumn
      assert_equal "a title", result.title
    end

    it "accepts title and attributes" do
      renderer = Gtk::CellRendererText.new
      result = Gtk::TreeViewColumn.new("a title", renderer, :text => 0)
      result.must_be_instance_of Gtk::TreeViewColumn
      assert_equal "a title", result.title
      # TODO: tree-view-columns lacks a attibutes getter, maybe traverse it to validate atrributes?
    end

    it "accepts attributes" do
      renderer = Gtk::CellRendererText.new
      result = Gtk::TreeViewColumn.new(nil, renderer, :text => 0)
      result.must_be_instance_of Gtk::TreeViewColumn
      # TODO: tree-view-columns lacks a attibutes getter, maybe traverse it to validate atrributes?
    end
  end
end
