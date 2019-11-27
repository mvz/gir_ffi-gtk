# frozen_string_literal: true

Gtk.load_class :Menu
module Gtk
  # Add non-introspected functions to Gtk::Lib
  module Lib
    attach_function(:gtk_menu_popup,
                    [:pointer, :pointer, :pointer,
                     :pointer, :pointer,
                     :uint, :uint32],
                    :void)
  end

  # Overrides for GtkMenu
  class Menu
    def popup(parent_menu_shell, parent_menu_item, button, activate_time, &func)
      v1 = Gtk::Widget.from(parent_menu_shell)
      v2 = Gtk::Widget.from(parent_menu_item)
      v3 = Gtk::MenuPositionFunc.from(func)
      v4 = GirFFI::ArgHelper.store(v3)
      v5 = button
      v6 = activate_time
      Gtk::Lib.gtk_menu_popup self, v1, v2, v3, v4, v5, v6
    end
  end
end
