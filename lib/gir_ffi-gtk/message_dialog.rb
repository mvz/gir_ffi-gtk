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

  class MessageDialog
    def self.new parent, flags, type, buttons, message
      ptr = Gtk::Lib.gtk_message_dialog_new(parent, flags, type, buttons,
                                            '%s',
                                            :string, message)
      constructor_wrap ptr
    end
  end
end
