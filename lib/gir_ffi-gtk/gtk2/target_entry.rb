Gtk.load_class :TargetEntry
module Gtk
  # Overrides for GtkTargetEntry
  class TargetEntry
    def initialize(target, flags, info)
      super()
      self.target = target
      self.flags = Gtk::TargetFlags.to_native flags, nil
      self.info = info
    end
  end
end
