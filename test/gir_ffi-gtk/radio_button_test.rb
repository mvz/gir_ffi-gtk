# frozen_string_literal: true

require "test_helper"

describe Gtk::RadioButton do
  describe ".new_from_widget" do
    it "works when called with nil" do
      result = Gtk::RadioButton.new_from_widget(nil)
      _(result).must_be_instance_of Gtk::RadioButton
    end

    it "works when called with another radio button" do
      btn = Gtk::RadioButton.new_from_widget nil
      result = Gtk::RadioButton.new_from_widget btn
      _(result).must_be_instance_of Gtk::RadioButton
    end
  end

  describe "#get_group" do
    it "returns a GLib::SList object" do
      btn = Gtk::RadioButton.new_from_widget nil
      grp = btn.get_group
      assert_instance_of GLib::SList, grp
    end
  end

  describe ".new" do
    it "works when called with nil" do
      result = Gtk::RadioButton.new nil
      _(result).must_be_instance_of Gtk::RadioButton
    end

    it "works when called with the result of #get_group" do
      btn = Gtk::RadioButton.new_from_widget nil
      result = Gtk::RadioButton.new btn.get_group
      _(result).must_be_instance_of Gtk::RadioButton
    end
  end
end
