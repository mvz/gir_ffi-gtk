require 'test_helper'

describe Gtk do
  describe "::init" do
    before do
      module DummyGtk
        def self.init arr
          ["baz", "qux", "zonk"]
        end

        include GirFFIGtk::AutoArgv
      end
    end

    it "does not take any arguments" do
      assert_raises(ArgumentError) { DummyGtk.init 1, ["foo"] }
      assert_raises(ArgumentError) { DummyGtk.init ["foo"] }
      assert_nothing_raised { DummyGtk.init }
    end

    it "replaces ARGV with the tail of the result of the original init function" do
      ARGV.replace ["foo", "bar"]
      DummyGtk.init
      assert_equal ["qux", "zonk"], ARGV.to_a
    end
  end

  describe "::main" do
    it "allows other threads to run" do
      a = []
      GLib.timeout_add(GLib::PRIORITY_DEFAULT, 100,
                       proc { Gtk.main_quit },
                       nil, nil)

      slow_thread = Thread.new do
        sleep 0.005
        a << "During run"
      end

      a << "Before run"
      Gtk.main
      a << "After run"

      slow_thread.join

      a.last.must_equal "After run"
    end
  end
end
