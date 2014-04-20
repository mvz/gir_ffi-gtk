module Gtk
  load_class :TreeSelection

  class TreeSelection
    def mode= symbol
      set_mode(Gtk::SelectionMode[symbol])
    end
  end
end

