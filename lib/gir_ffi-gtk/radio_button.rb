module Gtk
  load_class :RadioButton

  module Lib
    attach_function :gtk_radio_button_new, [:pointer], :pointer
    attach_function :gtk_radio_button_new_from_widget, [:pointer], :pointer
  end

  # Overrides for GtkRadioButton
  class RadioButton
    def self.new(group)
      _v1 = GLib::SList.from(Gtk::RadioButton, group)
      _v2 = Gtk::Lib.gtk_radio_button_new(_v1)
      _v3 = self.constructor_wrap(_v2)
      return _v3
    end

    def self.new_from_widget(radio_group_member)
      _v1 = Gtk::RadioButton.from(radio_group_member)
      _v2 = Gtk::Lib.gtk_radio_button_new_from_widget(_v1)
      _v3 = self.constructor_wrap(_v2)
      return _v3
    end
  end
end

