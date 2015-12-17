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

    setup_instance_method :connect_signals_full
    remove_method :connect_signals

    def connect_signals
      connect_signals_full(
        proc do |_builder, object, signal_name, handler_name, _connect_object, _flags, _user_data|
          handler = yield handler_name
          object.signal_connect signal_name, &handler if handler
        end,
        nil)
    end
  end
end
