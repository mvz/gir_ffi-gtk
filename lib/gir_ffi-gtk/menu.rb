# frozen_string_literal: true

Gtk.load_class :Menu
module Gtk
  # Overrides for GtkMenu
  class Menu
    unless method_defined? :popup
      # Smells of :reek:LongParameterList: due to the defined GtkMenu interface.
      # rubocop:disable Metrics/ParameterLists
      def popup(parent_menu_shell, parent_menu_item, func, data, button, activate_time)
        popup_for_device(nil,
                         parent_menu_shell, parent_menu_item, func, data,
                         nil,
                         button, activate_time)
      end
      # rubocop:enable Metrics/ParameterLists
    end
  end
end
