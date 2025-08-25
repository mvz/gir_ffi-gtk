# frozen_string_literal: true

Gtk.load_class :TreePath
module Gtk
  # Add non-introspected function to Gtk::Lib
  module Lib
    attach_function :gtk_tree_path_new_from_indices, [:int, :varargs], :pointer
  end

  # Overrides for GtkTreePath
  class TreePath
    def self.new_from_indices(*)
      obj = allocate
      obj.send(:initialize_from_indices, *)
      obj
    end

    def initialize_from_indices(indices)
      head, *rest = *indices
      args = rest.flat_map { |index| [:int, index] }
      ptr = Gtk::Lib.gtk_tree_path_new_from_indices(head, *args, :int, -1)
      store_pointer ptr
    end

    setup_instance_method! "get_indices"
    remove_method :get_indices

    def get_indices
      depth = get_depth
      ptr = Gtk::Lib.gtk_tree_path_get_indices self
      GirFFI::SizedArray.wrap(:gint32, depth, ptr)
    end
  end
end
