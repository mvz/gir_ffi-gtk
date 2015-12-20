Gtk.load_class :ListStore
module Gtk
  # Overrides for GtkListStore
  class ListStore
    setup_method :newv

    alias_method :initialize, :initializev
  end
end

