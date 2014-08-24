require 'test_helper'

describe Gtk::TreeSelection do
  describe "mode" do
    it "accept symbol" do
      store = Gtk::TreeStore.new(String)
      view = Gtk::TreeView.new(store)
      view.selection.mode = :single
      assert_equal :single, view.selection.mode
    end
  end
end
