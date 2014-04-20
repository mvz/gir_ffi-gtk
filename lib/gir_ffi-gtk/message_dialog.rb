module Gtk
  load_class :MessageDialog

  module Lib
    attach_function :gtk_message_dialog_new, [:pointer, :int, :int, :int, :string, :varargs], :pointer
  end

  class MessageDialog
    def self.new(options)
      self.constructor_wrap(
        Gtk::Lib.gtk_message_dialog_new(
          options[:parent],
          Gtk::DialogFlags[options[:flags]],
          Gtk::MessageType[options[:type]],
          Gtk::ButtonsType[options[:buttons_type]],
          "%s",
          :string,
          options[:message]
        )
      )
    end
  end
end

