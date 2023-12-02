# frozen_string_literal: true

module GirFFIGtk
  # Overrides for GtkImage methods
  module ImageOverrides
    def set_from_gicon(icon, size)
      super(icon, Gtk::IconSize.to_int(size))
    end
  end

  # Overrides for GtkImage class methods
  module ImageClassOverrides
    def new_from_icon_name(icon_name, size)
      super(icon_name, Gtk::IconSize.to_int(size))
    end

    def new_from_gicon(icon, size)
      super(icon, Gtk::IconSize.to_int(size))
    end
  end
end

Gtk.load_class :Image

Gtk::Image.prepend GirFFIGtk::ImageOverrides
Gtk::Image.singleton_class.prepend GirFFIGtk::ImageClassOverrides
