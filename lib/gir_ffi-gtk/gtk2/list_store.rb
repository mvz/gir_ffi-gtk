Gtk.load_class :ListStore
module Gtk
  # Overrides for GtkListStore
  class ListStore
    setup_method :newv
    setup_instance_method :set_valuesv

    alias_method :old_initialize, :initialize
    alias_method :initialize, :initializev
    remove_method :old_initialize

    alias_method :set, :set_valuesv
  end
end
