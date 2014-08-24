require 'test_helper'

describe Gtk::MessageDialog do
  describe ".new" do
    it "is ruby gnome2 compatible" do
      result = Gtk::MessageDialog.new(
        :parent => nil, :flags => :destroy_with_parent,
        :type => :info, :buttons_type => :close, 
        :message => "some text"
      )

      result.must_be_instance_of Gtk::MessageDialog
      assert_equal nil, result.parent
      assert_equal "some text", result.text
    end
  end
end
