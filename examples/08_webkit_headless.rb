require 'gir_ffi-gtk3'

GirFFI.setup :WebKit, '3.0'

Gtk.init

win = Gtk::OffscreenWindow.new
wv = WebKit::WebView.new
win.add(wv)

wv.signal_connect "load-finished" do
  pb = win.get_pixbuf
  pb.savev("google.png", "png", nil, nil)
  puts wv.get_title
  Gtk.main_quit
end

wv.load_uri('http://www.google.com/')
win.show_all

Gtk.main
