Gtk.load_class :TargetEntry
module Gtk
  # Overrides for GtkTargetEntry
  class TargetEntry
    def initialize(target, flags, info)
      super()
      self.target = target
      self.flags = flags
      self.info = info
    end
  end
end
