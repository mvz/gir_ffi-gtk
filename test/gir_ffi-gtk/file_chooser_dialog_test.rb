# frozen_string_literal: true

require "test_helper"

describe Gtk::FileChooserDialog do
  describe ".new" do
    it "creates a Gtk::FileChooserDialog with the right attributes" do
      dialog = Gtk::FileChooserDialog.new "Foo", nil, :save, [["Bar", :yes]]
      _(dialog.title).must_equal "Foo"
      _(dialog.action).must_equal :save
      button = if Gtk::MAJOR_VERSION == 3 && Gtk::MINOR_VERSION >= 12 && dialog.use_header_bar == 1
                 dialog.header_bar.children.to_a.last
               else
                 dialog.action_area.children.to_a.last
               end
      _(button.label).must_equal "Bar"
      _(dialog.response_for_widget(button)).must_equal Gtk::ResponseType.to_int(:yes)
    end
  end
end
