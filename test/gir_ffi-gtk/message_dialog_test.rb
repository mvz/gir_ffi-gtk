# frozen_string_literal: true

require "test_helper"

describe Gtk::MessageDialog do
  describe ".new" do
    it "creates a Gtk::MessageDialog with the right text" do
      dialog = Gtk::MessageDialog.new nil, :modal, :info, :close, "Foo"
      _(dialog.text).must_equal "Foo"
    end

    it "handles all % characters in the message as literals" do
      dialog = Gtk::MessageDialog.new nil, :modal, :info, :close, "Foo %"
      _(dialog.text).must_equal "Foo %"
    end
  end
end
