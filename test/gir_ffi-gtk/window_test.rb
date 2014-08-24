require 'test_helper'

describe Gtk::Window do
  describe ".new" do
    it "defaults to toplevel" do
      result = Gtk::Window.new
      result.must_be_instance_of Gtk::Window
      assert_equal :toplevel, result.type
    end

    it "accepts window type as symbol" do
      result = Gtk::Window.new :popup
      result.must_be_instance_of Gtk::Window
      assert_equal :popup, result.type
    end
  end
end
