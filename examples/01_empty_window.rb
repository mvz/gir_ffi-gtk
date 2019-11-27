#
# Based on the empty window Gtk+ tutorial example at
# http://library.gnome.org/devel/gtk-tutorial/2.90/c39.html
#
require 'gir_ffi-gtk3'

Gtk.init
win = Gtk::Window.new :toplevel
win.show
win.signal_connect("destroy") { Gtk.main_quit }
Gtk.main
