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
      _v1 = Gtk::Widget.from(parent_menu_shell)
      _v2 = Gtk::Widget.from(parent_menu_item)
      _v3 = Gtk::MenuPositionFunc.from(func)
      _v4 = GirFFI::ArgHelper.store(_v3)
      _v5 = button
      _v6 = activate_time
      Gtk::Lib.gtk_menu_popup self, _v1, _v2, _v3, _v4, _v5, _v6
    end
  end
end
