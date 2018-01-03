# frozen_string_literal: true

Gtk.load_class :TreePath
module Gtk
  # Add non-introspected function to Gtk::Lib
  module Lib
    if Gtk::MAJOR_VERSION == 2 || Gtk::MAJOR_VERSION == 3 && Gtk::MINOR_VERSION < 12
      attach_function :gtk_tree_path_new_from_indices, [:varargs], :pointer
    end
  end

  # Overrides for GtkTreePath
  class TreePath
    if Gtk::MAJOR_VERSION == 2 || Gtk::MAJOR_VERSION == 3 && Gtk::MINOR_VERSION < 12
      def self.new_from_indices(*args)
        obj = allocate
        obj.send :initialize_from_indices, *args
        obj
      end

      def initialize_from_indices(indices)
        args = indices.flat_map { |index| [:int, index] }
        ptr = Gtk::Lib.gtk_tree_path_new_from_indices(*args, :int, -1)
        store_pointer ptr
      end
    end

    if Gtk::MAJOR_VERSION == 2
      setup_instance_method 'get_indices'
      remove_method :get_indices

      def get_indices
        depth = get_depth
        ptr = Gtk::Lib.gtk_tree_path_get_indices self
        GirFFI::SizedArray.wrap(:gint32, depth, ptr)
      end
    end
  end
end
