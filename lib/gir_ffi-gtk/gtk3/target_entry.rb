# frozen_string_literal: true

Gtk.load_class :TargetEntry
module Gtk
  # Overrides for GtkTargetEntry
  class TargetEntry
    setup_method! :new

    def initialize_with_flags_conversion(target, flags, info)
      native_flags = Gtk::TargetFlags.to_native flags, nil
      initialize_without_flags_conversion target, native_flags, info
    end

    alias initialize_without_flags_conversion initialize
    alias initialize initialize_with_flags_conversion
  end
end
