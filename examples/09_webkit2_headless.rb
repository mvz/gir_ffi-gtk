require 'gir_ffi-gtk3'

GirFFI.setup :WebKit2, '4.0'

Gtk.init

win = Gtk::OffscreenWindow.new
web_view = WebKit2::WebView.new
win.add(web_view)

web_view.signal_connect "load-changed" do |_, event, _|
  case event
  when :finished
    pixbuf = win.get_pixbuf
    pixbuf.savev("google.png", "png", nil, nil)
    puts web_view.get_title
    Gtk.main_quit
  end
end

web_view.load_uri('http://www.google.com/')
win.show_all

Gtk.main
