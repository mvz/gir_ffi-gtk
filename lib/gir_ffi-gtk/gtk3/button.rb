# frozen_string_literal: true

module GirFFIGtk
  # Overrides for GtkAction class methods
  module ButtonClassOverrides
    def new_from_icon_name(icon_name, size)
      super icon_name, Gtk::IconSize.to_int(size)
    end
  end
end

Gtk.load_class :Button
Gtk::Button.singleton_class.prepend GirFFIGtk::ButtonClassOverrides
