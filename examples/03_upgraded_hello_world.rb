#
# Based on the 'Upgraded Hello world' Gtk+ tutorial example at
# http://library.gnome.org/devel/gtk-tutorial/2.90/x344.html
#
require 'gir_ffi-gtk3'

callback = lambda { |widget, data|
  puts "Hello again - #{data} was pressed"
}

Gtk.init

win = Gtk::Window.new(:toplevel)
win.title= "Hello Buttons!"

win.signal_connect "delete-event" do
  Gtk.main_quit
  false
end

win.border_width = 10

box = Gtk::HBox.new(false, 0)
win.add box

button = Gtk::Button.new_with_label("Button 1")
button.signal_connect "clicked", "button 1", &callback
box.pack_start button, true, true, 0
button.show

button = Gtk::Button.new_with_label("Button 2")
button.signal_connect "clicked", "button 2", &callback
box.pack_start button, true, true, 0
button.show

box.show
win.show

Gtk.main
