Gtk.load_class :RadioButton
module Gtk
  # Add non-introspected functions to Gtk::Lib
  module Lib
    attach_function :gtk_radio_button_new, [:pointer], :pointer
    attach_function :gtk_radio_button_new_from_widget, [:pointer], :pointer
  end

  # Overrides for GtkRadioButton
  class RadioButton
    def self.new group
      v1 = GLib::SList.from(Gtk::RadioButton, group)
      v2 = Gtk::Lib.gtk_radio_button_new(v1)
      constructor_wrap(v2)
    end

    def self.new_from_widget radio_group_member
      v1 = Gtk::RadioButton.from(radio_group_member)
      v2 = Gtk::Lib.gtk_radio_button_new_from_widget(v1)
      constructor_wrap(v2)
    end
  end
end
