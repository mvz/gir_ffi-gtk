# frozen_string_literal: true

require "test_helper"

module DummyGtk
  def self.init(_arr)
    %w(baz qux zonk)
  end

  include GirFFIGtk::AutoArgv
end

describe Gtk do
  describe "::init" do
    it "does not take any arguments" do
      assert_raises(ArgumentError) { DummyGtk.init 1, ["foo"] }
      assert_raises(ArgumentError) { DummyGtk.init ["foo"] }
      assert_nothing_raised { DummyGtk.init }
    end

    it "replaces ARGV with the tail of the result of the original init function" do
      ARGV.replace %w(foo bar)
      DummyGtk.init

      assert_equal %w(qux zonk), ARGV.to_a
    end
  end

  describe "::main" do
    it "allows other threads to run" do
      a = []
      GLib.timeout_add(GLib::PRIORITY_DEFAULT, 150) { Gtk.main_quit }

      slow_thread = Thread.new do
        sleep 0.005
        a << "During run"
      end

      a << "Before run"
      Gtk.main
      a << "After run"

      slow_thread.join

      _(a.last).must_equal "After run"
    end
  end
end
