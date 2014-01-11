# GirFFI-Gtk

GirFFI-based bindings for Gtk+. Supports both Gtk+ 2 and Gtk+ 3.

## Usage

Gtk2:

    require 'gir_ffi-gtk2'
    Gtk.init
    win = Gtk::Window.new :toplevel
    win.show
    GObject.signal_connect(win, "destroy") { Gtk.main_quit }
    Gtk.main

Gtk3:

    require 'gir_ffi-gtk3'
    Gtk.init
    win = Gtk::Window.new :toplevel
    win.show
    GObject.signal_connect(win, "destroy") { Gtk.main_quit }
    Gtk.main

See the `examples/` directory for more examples.

## Install

    gem install gir_ffi-gtk

## License

Copyright &copy; 2012&ndash;2013 [Matijs van Zuijlen](http://www.matijs.net)

GirFFI-Gtk is free software, distributed under the terms of the GNU Lesser
General Public License, version 2.1 or later. See the file COPYING.LIB for
more information.
