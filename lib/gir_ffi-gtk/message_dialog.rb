# frozen_string_literal: true

Gtk.load_class :MessageDialog

module Gtk
  # Add non-introspected function to Gtk::Lib
  module Lib
    attach_function :gtk_message_dialog_new, [:pointer,
                                              Gtk::DialogFlags,
                                              Gtk::MessageType,
                                              Gtk::ButtonsType,
                                              :string,
                                              :varargs], :pointer
  end

  # Overrides for GtkMessageDialog
  class MessageDialog
    alias old_initialize initialize

    def initialize(parent, flags, type, buttons, message)
      ptr = Gtk::Lib.gtk_message_dialog_new(parent, flags, type, buttons,
                                            "%s",
                                            :string, message)
      store_pointer(ptr)
    end

    remove_method :old_initialize
  end
end
