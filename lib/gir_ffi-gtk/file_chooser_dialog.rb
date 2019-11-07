# frozen_string_literal: true

Gtk.load_class :FileChooserDialog

module Gtk
  # Add non-introspected function to Gtk::Lib
  module Lib
    attach_function :gtk_file_chooser_dialog_new, [:string,
                                                   :pointer,
                                                   Gtk::FileChooserAction,
                                                   :varargs], :pointer
  end

  # Overrides for GtkFileChooserDialog
  class FileChooserDialog
    def self.new(*args)
      obj = allocate
      obj.send :initialize, *args
      obj
    end

    alias old_initialize initialize

    def initialize(title, parent, action, buttons)
      button_params = buttons.flat_map do |button_text, button_response|
        [:string, button_text, :int, Gtk::ResponseType.to_int(button_response)]
      end
      ptr = Gtk::Lib.gtk_file_chooser_dialog_new(title, parent, action,
                                                 *button_params, :string, nil)
      store_pointer(ptr)
    end

    remove_method :old_initialize
  end
end
