# frozen_string_literal: true

require "gir_ffi-gtk3"

GirFFI.setup :WebKit, "3.0"

Gtk.init

win = Gtk::OffscreenWindow.new
web_view = WebKit::WebView.new
win.add(web_view)

web_view.signal_connect "load-finished" do
  pixbuf = win.get_pixbuf
  pixbuf.savev("google.png", "png", nil, nil)
  puts web_view.get_title
  Gtk.main_quit
end

web_view.load_uri("http://www.google.com/")
win.show_all

Gtk.main
