Gtk.load_class :Container
module Gtk
  # Overrides for GtkContainer
  class Container
    def add_with_properties(widget, properties)
      add widget
      properties.each do |property_name, value|
        child_set_property widget, property_name.to_s, value
      end
    end

    setup_instance_method :child_get_property

    def child_get_property_with_override(widget, property_name)
      param_spec = object_class.find_child_property property_name
      unless param_spec
        raise ArgumentError,
          "child property named '#{property_name}' not found in #{self.class}"
      end
      gtype = param_spec.value_type
      gvalue = GObject::Value.for_gtype gtype

      child_get_property_without_override widget, property_name, gvalue
      gvalue.get_value
    end

    alias child_get_property_without_override child_get_property
    alias child_get_property child_get_property_with_override
  end
end
