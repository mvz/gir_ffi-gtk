module Gtk
  load_class :TreeStore

  module Lib
    attach_function :gtk_tree_store_new, [:int, :varargs], :pointer
    attach_function :gtk_tree_store_append, [:pointer, Gtk::TreeIter::Struct.by_ref, Gtk::TreeIter::Struct.by_ref], :void
  end

  class TreeStore

    TYPE_MAP = {
      Integer => GObject::TYPE_INT,
      String  => GObject::TYPE_STRING
    }

    def self.type_mapped_types(*types)
      types = types.first if types.size == 1 && types.first.is_a?(Array)
      types.map{ |type| TYPE_MAP[type] }
    end

    def self.new(*types)
      self.constructor_wrap(
        Gtk::Lib.gtk_tree_store_new(
          types.size,
          *type_mapped_types(*types).map{ |type|
            [:int,type]
          }.flatten
        )
      )
    end

    def column_types= *types
      set_column_types self.class.type_mapped_types(*types)
    end

    def append parent=nil
      iter = Gtk::TreeIter.new
      Gtk::Lib.gtk_tree_store_append(to_ptr,iter.instance_variable_get(:@struct),parent)
      iter.instance_variable_set(:@tree_store,self)
      iter
    end
  end
end

