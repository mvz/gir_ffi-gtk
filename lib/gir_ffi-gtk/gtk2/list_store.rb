Gtk.load_class :ListStore
module Gtk
  # Overrides for GtkListStore
  class ListStore
    setup_method :newv
    setup_method :set_valuesv

    alias_method :initialize, :initializev
    alias_method :set, :set_valuesv
  end
end
