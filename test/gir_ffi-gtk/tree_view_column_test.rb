# frozen_string_literal: true

require "test_helper"

describe Gtk::TreeViewColumn do
  describe ".new_with_attributes" do
    let(:renderer) { Gtk::CellRendererText.new }
    let(:column) do
      Gtk::TreeViewColumn.new_with_attributes("foo-title",
                                              renderer,
                                              text: 1)
    end
    let(:list_store) { Gtk::ListStore.new([GObject::TYPE_INT, GObject::TYPE_STRING]) }

    it "sets the column's title" do
      _(column.title).must_equal "foo-title"
    end

    it "packs the renderer into the column" do
      _(column.get_cells.to_a).must_equal [renderer]
    end

    it "adds the attribute mapping for the renderer" do
      row = list_store.append
      list_store.set_value(row, 1, "foo-value")
      column.cell_set_cell_data(list_store, row, false, false)

      _(renderer.text).must_equal "foo-value"
    end

    it "allows not specifying any attributes" do
      col = Gtk::TreeViewColumn.new_with_attributes("foo-title", renderer)

      _(col).must_be_instance_of Gtk::TreeViewColumn
    end
  end

  describe "#set_attributes" do
    let(:renderer) { Gtk::CellRendererText.new }
    let(:column) { Gtk::TreeViewColumn.new }
    let(:list_store) { Gtk::ListStore.new([GObject::TYPE_INT, GObject::TYPE_STRING]) }

    before do
      column.pack_start(renderer, false)
      column.set_attributes(renderer, text: 1)
    end

    it "adds the attribute mapping for the renderer" do
      row = list_store.append
      list_store.set_value(row, 1, "foo-value")
      column.cell_set_cell_data(list_store, row, false, false)

      _(renderer.text).must_equal "foo-value"
    end
  end
end
