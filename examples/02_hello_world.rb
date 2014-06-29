#
# Based on the 'Hello world' Gtk+ tutorial example at
# http://library.gnome.org/devel/gtk-tutorial/2.90/c39.html#SEC-HELLOWORLD
#
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'gir_ffi-gtk3'

Gtk.init

win = Gtk::Window.new(:toplevel)
win.signal_connect "delete-event" do
  puts "delete event occured"
  true
end

win.signal_connect("destroy") { Gtk.main_quit }
win.border_width = 10

but = Gtk::Button.new_with_label("Hello World")
but.signal_connect("clicked") { win.destroy }

win.add but

but.show
win.show

Gtk.main
