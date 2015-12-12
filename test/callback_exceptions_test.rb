require 'test_helper'

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
        lambda { GObject.signal_emit object, "destroy" }.must_raise CallbackTestException
      end
    end

    describe "when the signal is emitted during an event loop" do
      it "causes loop run to be terminated with an exception" do
        emit_func = proc {
          GObject.signal_emit object, "destroy"
          false
        }
        GLib.timeout_add GLib::PRIORITY_DEFAULT, 1, emit_func, nil, nil
        # Guard against runaway loop
        GLib.timeout_add GLib::PRIORITY_DEFAULT, 500, proc { Gtk.main_quit }, nil, nil
        proc do
          Gtk.main
        end.must_raise CallbackTestException
      end
    end
  end

  describe "for other callbacks" do
    describe "when the callback occurs during an event loop" do
      it "causes loop run to be terminated with an exception" do
        raise_func = FFI::Function.new(:bool, [:pointer]) {
          raise CallbackTestException, "Boom"
        }

        GLib.timeout_add GLib::PRIORITY_DEFAULT, 1, raise_func, nil, nil
        # Guard against runaway loop
        GLib.timeout_add GLib::PRIORITY_DEFAULT, 500, proc { Gtk.main_quit }, nil, nil
        proc do
          Gtk.main
        end.must_raise CallbackTestException
      end
    end
  end
end

