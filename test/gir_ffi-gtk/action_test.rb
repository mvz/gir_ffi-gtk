require 'test_helper'

describe Gtk::Action do
  let(:action) { Gtk::Action.new('hi', 'Hello', 'hey there', Gtk::STOCK_FILE) }

  describe '#create_icon' do
    it 'works when called with a symbol' do
      result = action.create_icon :dialog
      result.must_be_instance_of Gtk::Image
    end

    it 'works when called with an integer' do
      result = action.create_icon 4
      result.must_be_instance_of Gtk::Image
    end
  end
end
