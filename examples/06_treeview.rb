#
# Based on the 'Hello world' Gtk+ tutorial example at
# http://library.gnome.org/devel/gtk-tutorial/2.90/c39.html#SEC-HELLOWORLD
#
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'gir_ffi-gtk3'

Gtk.init


#Add window.
win = Gtk::Window.new(:toplevel)
win.resize(640, 480)
GObject.signal_connect(win, "destroy"){ Gtk.main_quit }


#Add treeview.
tv = Gtk::TreeView.new


#Add store.
ls = Gtk::ListStore.new([GObject::TYPE_STRING])
tv.set_model(ls)


#Add column.
lab = Gtk::Label.new("Name")
rend = Gtk::CellRendererText.new

col = Gtk::TreeViewColumn.new
col.set_widget(lab)
col.pack_start(rend, true)
col.add_attribute(rend, "text", 0)

lab.show

tv.append_column(col)


#Add rows.
iter = ls.append
ls.set_value(iter, 0, "Kasper")

iter = ls.append
ls.set_value(iter, 0, "Christina")


win.add tv
tv.show

win.show

Gtk.main