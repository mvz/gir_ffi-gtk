Gtk.load_class :TreeStore
module Gtk
  # Overrides for GtkTreeStore
  class TreeStore
    setup_method :newv
    setup_instance_method :set_valuesv
    setup_instance_method :insert_with_valuesv

    alias_method :old_initialize, :initialize
    alias_method :initialize, :initializev
    remove_method :old_initialize

    alias_method :insert_with_values, :insert_with_valuesv
    alias_method :set, :set_valuesv
  end
end
