require 'test_helper'

describe Gtk::Container do
  let(:container) { Gtk::Table.new 1, 1, true }
  let(:widget) { Gtk::Label.new 'foo' }

  describe '#add_with_properties' do
    before do
      container.add_with_properties widget, expand: true, pack_type: :end
    end

    it 'adds the widget to the container' do
      container.get_children.to_a.must_equal [widget]
    end
  end

  describe '#child_get_property' do
    it 'fetches the given child property' do
      container.add widget
      container.child_set_property(widget, 'left-attach', 1)
      container.child_get_property(widget, 'left-attach').must_equal 1
    end
  end
end
