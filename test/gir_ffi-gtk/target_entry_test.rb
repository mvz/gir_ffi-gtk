# frozen_string_literal: true

require "test_helper"

describe Gtk::TargetEntry do
  describe ".new" do
    it "takes and uses three arguments" do
      entry = Gtk::TargetEntry.new("foo", 3, 42)

      _(entry.target).must_equal "foo"
      _(entry.flags).must_equal 3
      _(entry.info).must_equal 42
    end

    it "allows symbol values for the second argument" do
      entry = Gtk::TargetEntry.new("foo", :same_app, 42)

      _(entry.target).must_equal "foo"
      _(entry.flags).must_equal 1
      _(entry.info).must_equal 42
    end
  end
end
