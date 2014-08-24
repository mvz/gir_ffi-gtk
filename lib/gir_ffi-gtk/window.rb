module Gtk
  load_class :Window

  module Lib
    attach_function :gtk_window_new, [:int], :pointer
  end

  class Window
    def self.new(type = :toplevel)
      self.constructor_wrap(
        Gtk::Lib.gtk_window_new(
          Gtk::WindowType[type],
        )
      )
    end
  end
end

