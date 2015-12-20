Gtk.load_class :ListStore
module Gtk
  # Overrides for GtkListStore
  class ListStore
    setup_instance_method :insert_with_valuesv

    alias_method :insert_with_values, :insert_with_valuesv

    def set_value_with_value_conversion(iter, column, value)
      if value.nil?
        value = GObject::Value.for_gtype get_column_type(column)
      end
      set_value_without_value_conversion iter, column, value
    end

    alias_method :set_value_without_value_conversion, :set_value
    alias_method :set_value, :set_value_with_value_conversion
  end
end
