# frozen_string_literal: true

require 'test_helper'

describe Gtk::FileChooserDialog do
  describe '.new' do
    it 'creates a Gtk::FileChooserDialog with the right attributes' do
      dialog = Gtk::FileChooserDialog.new 'Foo', nil, :save, [['Bar', :yes]]
      dialog.title.must_equal 'Foo'
      dialog.action.must_equal :save
      button = if Gtk::MAJOR_VERSION == 3 && Gtk::MINOR_VERSION >= 12
                 dialog.header_bar.children.to_a.last
               else
                 dialog.action_area.children.to_a.last
               end
      button.label.must_equal 'Bar'
      dialog.response_for_widget(button).must_equal Gtk::ResponseType.to_int(:yes)
    end
  end
end
