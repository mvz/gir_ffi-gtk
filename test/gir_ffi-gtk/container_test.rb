require 'test_helper'

describe Gtk::Container do
  describe '#add_with_properties' do
    let(:container) { Gtk::Table.new 1, 1, true }
    let(:widget) { Gtk::Label.new 'foo' }

    before do
      container.add_with_properties widget, expand: true, pack_type: :end
    end

    it 'adds the widget to the container' do
      container.get_children.to_a.must_equal [widget]
    end
  end
end
