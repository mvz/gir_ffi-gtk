module Gtk
  load_class :TreePath

  class TreePath
    def indices
      get_indices.to_a
    end
  end
end

