# frozen_string_literal: true

Gtk.load_class :ListStore
module Gtk
  # Overrides for GtkListStore
  class ListStore
    setup_method :newv
    setup_instance_method :set_valuesv

    alias old_initialize initialize
    alias initialize initializev
    remove_method :old_initialize

    alias set set_valuesv
  end
end
