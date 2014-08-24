module Gtk
  load_class :TreeViewColumn

  module Lib
    attach_function :gtk_tree_view_column_new, [], :pointer
    attach_function :gtk_tree_view_column_new_with_attributes, [:string, :pointer, :varargs], :pointer
    attach_function :gtk_tree_view_column_set_attributes, [:pointer, :pointer, :varargs], :pointer
  end

  class TreeViewColumn
    def self.new(title=nil,renderer=nil,options={})
      attributes = options.map{ |key,value| [:string,key.to_s,:int,value] }.flatten
      has_title_and_options = title && options.size > 0

      column = self.constructor_wrap(
        if has_title_and_options
          Gtk::Lib.gtk_tree_view_column_new_with_attributes(title,renderer,*attributes,:string,nil)
        else
          Gtk::Lib.gtk_tree_view_column_new()
        end
      )

      unless has_title_and_options
        column.title = title if title
        if options.size > 0
          Gtk::Lib.gtk_tree_view_column_set_attributes(column.to_ptr,renderer,*attributes,:string,nil)
        end
      end

      column
    end
  end
end

