require File.expand_path('../test_helper.rb', File.dirname(__FILE__))

require 'gir_ffi-gtk3'

describe Gtk::Menu do
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
