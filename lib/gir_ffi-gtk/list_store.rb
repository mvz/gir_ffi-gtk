# frozen_string_literal: true

Gtk.load_class :ListStore
module Gtk
  # Overrides for GtkListStore
  class ListStore
    setup_instance_method! :insert_with_valuesv

    alias insert_with_values insert_with_valuesv

    setup_instance_method! :set_value

    def set_value_with_value_conversion(iter, column, value)
      value = GObject::Value.for_gtype get_column_type(column) if value.nil?
      set_value_without_value_conversion iter, column, value
    end

    alias set_value_without_value_conversion set_value
    alias set_value set_value_with_value_conversion
  end
end
