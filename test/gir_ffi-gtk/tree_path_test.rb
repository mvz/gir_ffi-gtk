require 'test_helper'

describe Gtk::TreePath do
  describe "indices" do
    it "provides indices" do
      path = Gtk::TreePath.new_from_indices([123])
      assert_equal [123],path.indices
    end
  end
end
