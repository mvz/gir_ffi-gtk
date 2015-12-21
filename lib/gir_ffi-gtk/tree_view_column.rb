Gtk.load_class :TreeViewColumn
module Gtk
  # Overrides for Gtk::TreeViewColumn
  class TreeViewColumn
    def self.new_with_attributes(*args)
      obj = allocate
      obj.send :initialize_with_attributes, *args
      obj
    end

    private

    def initialize_with_attributes(title, renderer, attributes = {})
      initialize
      set_title title
      pack_start(renderer, false)
      attributes.each do |attribute, column|
        add_attribute renderer, attribute.to_s, column
      end
    end
  end
end
