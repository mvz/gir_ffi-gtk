# frozen_string_literal: true

Gtk.load_class :TreeStore
module Gtk
  # Overrides for GtkTreeStore
  class TreeStore
    def set_value_with_value_conversion(iter, column, value)
      value = GObject::Value.for_gtype get_column_type(column) if value.nil?
      set_value_without_value_conversion iter, column, value
    end

    alias set_value_without_value_conversion set_value
    alias set_value set_value_with_value_conversion
  end
end
