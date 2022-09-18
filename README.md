# GirFFI-Gtk

GirFFI-based Ruby bindings for Gtk+. Supports both Gtk+ 2 and Gtk+ 3.

## Usage

Gtk+ 2:

```ruby
require 'gir_ffi-gtk2'
Gtk.init
win = Gtk::Window.new :toplevel
win.show
GObject.signal_connect(win, "destroy") { Gtk.main_quit }
Gtk.main
```

Gtk+ 3:

```ruby
require 'gir_ffi-gtk3'
Gtk.init
win = Gtk::Window.new :toplevel
win.show
GObject.signal_connect(win, "destroy") { Gtk.main_quit }
Gtk.main
```

See the `examples/` directory for more examples.

## Install

```bash
gem install gir_ffi-gtk
```

## Requirements

First, make sure the `ffi` gem is properly installed. See its documentation for
the necessary requirements.

GirFFI-Gtk itself depends on the [GirFFI](https://rubygems.org/gems/gir_ffi)
gem, and the gobject-introspection and gtk+ libaries.

For Debian-like systems, try the following for Gtk+ 3:

```bash
apt-get install libgirepository1.0-dev gobject-introspection gir1.2-gtk-3.0
```

and for Gtk+ 2:

```bash
apt-get install libgirepository1.0-dev gobject-introspection gir1.2-gtk-2.0
```

This gem has not been tested on Mac OS X or Microsoft Windows. YMMV. Pull
requests to support these platforms are welcome.

## License

Copyright &copy; 2012&ndash;2022 [Matijs van Zuijlen](http://www.matijs.net)

GirFFI-Gtk is free software, distributed under the terms of the GNU Lesser
General Public License, version 2.1 or later. See the file COPYING.LIB for
more information.
