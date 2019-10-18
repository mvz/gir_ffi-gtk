# frozen_string_literal: true

require 'test_helper'

describe Gtk::Dialog do
  describe '.new_with_buttons' do
    it 'creates a Gtk::Dialog with the right title and buttons' do
      dialog = Gtk::Dialog.new_with_buttons 'Foo', nil, :modal, [['Bar', :yes]]
      _(dialog.title).must_equal 'Foo'
      button = dialog.action_area.children.first
      _(button.label).must_equal 'Bar'
      _(dialog.response_for_widget(button)).must_equal Gtk::ResponseType.to_int(:yes)
    end
  end
end
