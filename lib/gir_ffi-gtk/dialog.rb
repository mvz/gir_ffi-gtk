# frozen_string_literal: true

Gtk.load_class :Dialog

module Gtk
  # Add non-introspected function to Gtk::Lib
  module Lib
    attach_function :gtk_dialog_new_with_buttons, [:string,
                                                   :pointer,
                                                   Gtk::DialogFlags,
                                                   :varargs], :pointer
  end

  # Overrides for GtkDialog
  class Dialog
    def self.new_with_buttons(*args)
      obj = allocate
      obj.send :initialize_with_buttons, *args
      obj
    end

    def initialize_with_buttons(title, parent, flags, buttons)
      button_params = buttons.flat_map do |button_text, button_response|
        [:string, button_text, :int, Gtk::ResponseType.to_int(button_response)]
      end
      ptr = Gtk::Lib.gtk_dialog_new_with_buttons(title, parent, flags,
                                                 *button_params, :string, nil)
      store_pointer(ptr)
    end
  end
end
