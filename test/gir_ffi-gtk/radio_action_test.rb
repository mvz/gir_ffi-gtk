# frozen_string_literal: true

require "test_helper"

describe Gtk::RadioAction do
  describe "#get_group" do
    it "returns a GLib::SList object" do
      action = Gtk::RadioAction.new "name", "label", "tooltip", nil, 1
      grp = action.get_group
      _(grp).must_be_instance_of GLib::SList
    end
  end

  describe "#set_group" do
    let(:action) { Gtk::RadioAction.new "name", "label", "tooltip", nil, 1 }

    it "accepts nil" do
      action.set_group nil
      pass
    end

    it "accepts a GLib::SList object" do
      grp = action.get_group
      other_action = Gtk::RadioAction.new("other-name", "other-label",
                                          "other-tooltip", nil, 2)
      other_action.set_group grp
      pass
    end
  end
end
