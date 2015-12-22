Gtk.load_class :Container
module Gtk
  # Overrides for GtkContainer
  class Container
    def add_with_properties(widget, properties)
      add widget
    end
  end
end
