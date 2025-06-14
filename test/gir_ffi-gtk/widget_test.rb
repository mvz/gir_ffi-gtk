# frozen_string_literal: true

require "test_helper"

describe Gtk::Widget do
  describe "#add_events" do
    let(:widget) { Gtk::EventBox.new }
    let(:expected_native) do
      Gdk::EventMask.to_int(focus_change_mask: true,
                            button_press_mask: true)
    end

    before do
      ev_int = Gdk::EventMask.to_int :focus_change_mask
      widget.set_events ev_int
    end

    it "works when called with a bitmask hash" do
      widget.add_events button_press_mask: true
      ev = widget.get_events

      _(Gdk::EventMask.to_int(ev)).must_equal expected_native
    end

    it "works when called with a symbol" do
      widget.add_events :button_press_mask
      ev = widget.get_events

      _(Gdk::EventMask.to_int(ev)).must_equal expected_native
    end

    it "works when called with an int" do
      ev_int = Gdk::EventMask.to_int :button_press_mask
      widget.add_events ev_int
      ev = widget.get_events

      _(Gdk::EventMask.to_int(ev)).must_equal expected_native
    end
  end

  describe "#get_events" do
    let(:widget) { Gtk::EventBox.new }

    it "returns a bitmap hash" do
      widget.set_events focus_change_mask: true
      ev = widget.get_events

      _(ev).must_equal focus_change_mask: true
    end
  end

  describe "#set_events" do
    let(:widget) { Gtk::EventBox.new }
    let(:expected_native) { Gdk::EventMask.to_int(focus_change_mask: true) }

    it "works when called with a bitmask hash" do
      widget.set_events focus_change_mask: true
      ev = widget.get_events

      _(Gdk::EventMask.to_int(ev)).must_equal expected_native
    end

    it "works when called with a symbol" do
      widget.set_events :focus_change_mask
      ev = widget.get_events

      _(Gdk::EventMask.to_int(ev)).must_equal expected_native
    end

    it "works when called with an int" do
      ev_int = Gdk::EventMask.to_int :focus_change_mask
      widget.set_events ev_int
      ev = widget.get_events

      _(Gdk::EventMask.to_int(ev)).must_equal expected_native
    end
  end

  describe "#events" do
    let(:widget) { Gtk::EventBox.new }

    it "returns a bitmap hash" do
      widget.set_events focus_change_mask: true
      ev = widget.events

      _(ev).must_equal focus_change_mask: true
    end
  end

  describe "#events=" do
    let(:widget) { Gtk::EventBox.new }
    let(:expected_native) { Gdk::EventMask.to_int(focus_change_mask: true) }

    it "works when called with a bitmask hash" do
      widget.events = { focus_change_mask: true }
      ev = widget.get_events

      _(Gdk::EventMask.to_int(ev)).must_equal expected_native
    end

    it "works when called with a symbol" do
      widget.events = :focus_change_mask
      ev = widget.get_events

      _(Gdk::EventMask.to_int(ev)).must_equal expected_native
    end

    it "works when called with an int" do
      ev_int = Gdk::EventMask.to_int :focus_change_mask
      widget.events = ev_int
      ev = widget.get_events

      _(Gdk::EventMask.to_int(ev)).must_equal expected_native
    end
  end
end
