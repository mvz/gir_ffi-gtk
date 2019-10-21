# frozen_string_literal: true

require "test_helper"

describe Gtk::TreePath do
  describe "#get_indices" do
    it "returns an enumerable of the TreePath's indices" do
      tree_path = Gtk::TreePath.new_from_string "1:2:3"
      _(tree_path.get_indices.to_a).must_equal [1, 2, 3]
    end
  end

  describe ".new_from_indices" do
    it "creates a Gtk::TreePath with the right indices" do
      tree_path = Gtk::TreePath.new_from_indices [1, 2, 3]
      _(tree_path.get_indices.to_a).must_equal [1, 2, 3]
    end
  end
end
