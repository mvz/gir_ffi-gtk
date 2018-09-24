# frozen_string_literal: true

module GirFFIGtk
  # Overrides for GtkAction
  module ActionOverrides
    def create_icon(icon_size)
      super Gtk::IconSize.to_int(icon_size)
    end
  end
end

Gtk.load_class :Action
Gtk::Action.prepend GirFFIGtk::ActionOverrides
