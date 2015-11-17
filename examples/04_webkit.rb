#!/usr/bin/env ruby
#
# Based on https://web.archive.org/web/20110228141616/http://www.idle-hacking.com/2010/02/webkit-ruby-and-gtk/
#

require 'gir_ffi-gtk3'

GirFFI.setup :WebKit2, '4.0'

Gtk.init

win = Gtk::Window.new :toplevel
wv = WebKit2::WebView.new
win.add(wv)
win.show_all
wv.load_uri('http://www.google.com/')
win.signal_connect('destroy') { Gtk.main_quit }
Gtk.main
