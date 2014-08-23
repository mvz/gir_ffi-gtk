require 'test_helper'

describe GirFFIGtk::BaseOverrides do
  describe "::init" do
    before do
      module DummyGtk
        def self.init arr
          ["baz", "qux", "zonk"]
        end
        include GirFFIGtk::BaseOverrides
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
end
