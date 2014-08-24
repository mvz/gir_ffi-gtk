module Gtk
  load_class :TreeView

  module Lib
    attach_function :gtk_tree_view_new, [], :pointer
    attach_function :gtk_tree_view_new_with_model, [:pointer], :pointer
  end

  class TreeView
    def self.new(model=nil)
      self.constructor_wrap(
        if model
          Gtk::Lib.gtk_tree_view_new_with_model(model)
        else
          Gtk::Lib.gtk_tree_view_new()
        end
      )
    end
  end
end

