# frozen_string_literal: true

require "test_helper"

describe Gtk::Button do
  describe ".new_from_icon_name" do
    before do
      skip if Gtk::MAJOR_VERSION == 2
    end

    it "works when called with a symbol" do
      result = Gtk::Button.new_from_icon_name("hi", :dialog)

      _(result).must_be_instance_of Gtk::Button
    end

    it "works when called with an integer" do
      result = Gtk::Button.new_from_icon_name("hi", 4)

      _(result).must_be_instance_of Gtk::Button
    end
  end
end
