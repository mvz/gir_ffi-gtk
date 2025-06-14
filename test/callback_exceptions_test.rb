# frozen_string_literal: true

require "test_helper"

class CallbackTestException < RuntimeError; end

describe "An exception in a callback" do
  describe "for signals" do
    let(:object) { Gtk::Window.new :toplevel }

    before do
      object.signal_connect "destroy" do
        raise CallbackTestException, "Boom"
      end
    end

    describe "when the signal is emitted synchronously" do
      it "raises an error" do
        _(-> { GObject.signal_emit object, "destroy" }).must_raise CallbackTestException
      end
    end

    describe "when the signal is emitted during an event loop" do
      it "causes loop run to be terminated with an exception" do
        GLib.timeout_add GLib::PRIORITY_DEFAULT, 1 do
          GObject.signal_emit object, "destroy"
          false
        end
        # Guard against runaway loop
        @guard = GLib.timeout_add(GLib::PRIORITY_DEFAULT, 1000) { Gtk.main_quit }

        _(-> { Gtk.main }).must_raise CallbackTestException
      end

      after do
        GLib.source_remove @guard
      end
    end
  end

  describe "for other callbacks" do
    describe "when the callback occurs during an event loop" do
      it "causes loop run to be terminated with an exception" do
        GLib.timeout_add GLib::PRIORITY_DEFAULT, 1 do
          raise CallbackTestException, "Boom"
        end
        # Guard against runaway loop
        @guard = GLib.timeout_add(GLib::PRIORITY_DEFAULT, 1000) { Gtk.main_quit }

        _(-> { Gtk.main }).must_raise CallbackTestException
      end

      after do
        GLib.source_remove @guard
      end
    end
  end
end
