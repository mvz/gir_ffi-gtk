require 'test_helper'

describe Gtk::Menu do
  describe '#popup' do
    it 'delegates to popup_for_device' do
      default_method = GObjectIntrospection::IRepository.default.
        find_by_name('Gtk', 'Menu').
        find_method('popup')
      skip 'No overrided needed for Gtk::Menu#popup' if default_method
      mnu = Gtk::Menu.new
      mock(mnu).popup_for_device(nil,
                                 'parent_menu_shell', 'parent_menu_item',
                                 'func', 'data',
                                 nil,
                                 'button', 'activate_time')
      mnu.popup('parent_menu_shell', 'parent_menu_item', 'func', 'data',
                'button', 'activate_time')
    end
  end
end
