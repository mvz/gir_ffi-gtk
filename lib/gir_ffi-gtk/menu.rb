module Gtk
  load_class :Menu

  # Overrides for GtkMenu
  class Menu
    def popup(parent_menu_shell, parent_menu_item, func, data, button, activate_time)
      popup_for_device(nil,
                       parent_menu_shell, parent_menu_item, func, data,
                       nil,
                       button, activate_time)
    end
  end
end
