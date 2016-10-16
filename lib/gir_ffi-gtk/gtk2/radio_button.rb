Gtk.load_class :RadioButton
module Gtk
  # Add non-introspected functions to Gtk::Lib
  module Lib
    attach_function :gtk_radio_button_new, [:pointer], :pointer
    attach_function :gtk_radio_button_new_from_widget, [:pointer], :pointer
  end

  # Overrides for GtkRadioButton
  class RadioButton
    def self.new_from_widget(*args)
      obj = allocate
      obj.send :initialize_from_widget, *args
      obj
    end

    alias old_initialize initialize

    def initialize(group)
      list = GLib::SList.from(Gtk::RadioButton, group)
      ptr = Gtk::Lib.gtk_radio_button_new(list)
      store_pointer(ptr)
    end

    remove_method :old_initialize

    def initialize_from_widget(radio_group_member)
      widget = Gtk::RadioButton.from(radio_group_member)
      ptr = Gtk::Lib.gtk_radio_button_new_from_widget(widget)
      store_pointer(ptr)
    end
  end
end
