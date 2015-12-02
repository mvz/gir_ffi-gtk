Gtk.load_class :RadioAction
module Gtk
  # Add non-introspected functions to Gtk::Lib
  module Lib
    attach_function :gtk_radio_action_set_group, [:pointer, :pointer], :void
  end

  # Overrides for GtkRadioAction
  class RadioAction
    def set_group(group)
      Gtk::Lib.gtk_radio_action_set_group self, group
    end
  end
end
