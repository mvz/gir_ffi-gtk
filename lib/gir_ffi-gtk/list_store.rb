Gtk.load_class :ListStore
module Gtk
  # Overrides for GtkListStore
  class ListStore
    setup_instance_method :insert_with_valuesv

    alias_method :insert_with_values, :insert_with_valuesv
  end
end
