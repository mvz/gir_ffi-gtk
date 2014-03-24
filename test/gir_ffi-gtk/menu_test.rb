require 'test_helper'

describe Gtk::Menu do
  unless GObjectIntrospection::IRepository.default.find_by_name('Gtk', 'Menu').find_method('popup')
    describe "#popup" do
      it "delegates to popup_for_device" do
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
end
