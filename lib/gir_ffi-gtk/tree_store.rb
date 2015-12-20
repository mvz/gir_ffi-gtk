Gtk.load_class :TreeStore
module Gtk
  # Overrides for GtkTreeStore
  class TreeStore
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
