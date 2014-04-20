module Gtk
  load_class :TreeIter

  class TreeIter
    def []= i,value
      instance_variable_get(:@tree_store).set(self,[i],[value])
    end
  end
end

