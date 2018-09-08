# frozen_string_literal: true

Gtk.load_class :Builder
module Gtk
  # Overrides for GtkBuilder
  class Builder
    setup_instance_method! :add_from_string

    def add_from_string_with_auto_length(buffer)
      add_from_string_without_auto_length buffer, buffer.length
    end

    alias add_from_string_without_auto_length add_from_string
    alias add_from_string add_from_string_with_auto_length

    setup_instance_method! :connect_signals_full
    remove_method :connect_signals

    AFTER_FLAG = GObject::ConnectFlags[:after]

    def connect_signals
      # rubocop:disable Metrics/ParameterLists
      connect_signals_full do |_, object, signal_name, handler_name, _, flags, _|
        handler = yield handler_name
        return unless handler

        if flags & AFTER_FLAG == AFTER_FLAG
          object.signal_connect_after signal_name, &handler
        else
          object.signal_connect signal_name, &handler
        end
      end
      # rubocop:enable Metrics/ParameterLists
    end
  end
end
