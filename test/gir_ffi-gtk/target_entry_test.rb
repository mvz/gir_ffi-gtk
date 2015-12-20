require 'test_helper'

describe Gtk::TargetEntry do
  describe '.new' do
    it 'takes and uses three arguments' do
      entry = Gtk::TargetEntry.new('foo', 3, 42)
      entry.target.must_equal 'foo'
      entry.flags.must_equal 3
      entry.info.must_equal 42
    end
  end
end
