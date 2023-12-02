# frozen_string_literal: true

module GirFFIGtk
  # Overrides for GtkWidget methods
  module WidgetOverrides
    def add_events(events)
      super(Gdk::EventMask.to_int events)
    end

    def get_events
      Gdk::EventMask.from_native super
    end

    def set_events(events)
      super(Gdk::EventMask.to_int events)
    end
  end
end

Gtk.load_class :Widget

Gtk::Widget.setup_instance_method! :add_events
Gtk::Widget.setup_instance_method! :get_events
Gtk::Widget.setup_instance_method! :set_events
Gtk::Widget.prepend GirFFIGtk::WidgetOverrides
