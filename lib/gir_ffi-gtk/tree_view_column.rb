# frozen_string_literal: true

Gtk.load_class :TreeViewColumn
module Gtk
  # Overrides for Gtk::TreeViewColumn
  class TreeViewColumn
    setup_method! :new

    def self.new_with_attributes(*)
      obj = allocate
      obj.send(:initialize_with_attributes, *)
      obj
    end

    def set_attributes(renderer, attributes)
      attributes.each do |attribute, column|
        add_attribute renderer, attribute.to_s, column
      end
    end

    private

    def initialize_with_attributes(title, renderer, attributes = {})
      initialize
      set_title title
      pack_start(renderer, false)
      set_attributes(renderer, attributes)
    end
  end
end
