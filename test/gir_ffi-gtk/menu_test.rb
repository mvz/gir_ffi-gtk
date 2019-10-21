# frozen_string_literal: true

require "test_helper"

describe Gtk::Menu do
  describe "#popup" do
    it "can be called with 4 arguments" do
      mnu = Gtk::Menu.new
      mnu.popup(nil, nil, 1, 32)
    end
  end
end
