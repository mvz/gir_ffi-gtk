Gtk.load_class :Builder
module Gtk
  # Overrides for GtkBuilder
  class Builder
    setup_instance_method :add_from_string

    def add_from_string_with_auto_length(buffer)
      add_from_string_without_auto_length buffer, buffer.length
    end

    alias_method :add_from_string_without_auto_length, :add_from_string
    alias_method :add_from_string, :add_from_string_with_auto_length
  end
end
