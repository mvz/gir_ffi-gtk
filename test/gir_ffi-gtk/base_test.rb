require 'test_helper'

describe Gtk do
  describe "::init" do
    before do
      save_module :Gtk
      ::Object.const_set :Gtk, Module.new
      Gtk.class_eval do
        def self.init arr
          ["baz", "qux", "zonk"]
        end
      end
      mock(Gtk).setup_method("init") { }

      load 'gir_ffi-gtk/base.rb'
    end

    it "does not take any arguments" do
      assert_raises(ArgumentError) { Gtk.init 1, ["foo"] }
      assert_raises(ArgumentError) { Gtk.init ["foo"] }
      assert_nothing_raised { Gtk.init }
    end

    it "replaces ARGV with the tail of the result of the original init function" do
      ARGV.replace ["foo", "bar"]
      Gtk.init
      assert_equal ["qux", "zonk"], ARGV.to_a
    end

    after do
      restore_module :Gtk
    end
  end
end
