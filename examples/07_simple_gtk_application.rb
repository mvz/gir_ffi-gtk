# frozen_string_literal: true

require "gir_ffi-gtk3"

myapp = Gtk::Application.new("org.gtk.example", :handles_command_line)

myapp.signal_connect "command-line" do |app, _command_line|
  app.activate
  0
end

myapp.signal_connect "activate" do |app|
  win = Gtk::ApplicationWindow.new(app)
  win.set_title("Gtk Application example")
  win.set_default_size(200, 200)

  button_box = Gtk::ButtonBox.new(:horizontal)
  win.add(button_box)

  button = Gtk::Button.new_with_label("Hello world")
  button.signal_connect "clicked" do
    puts "Hello World"
    app.quit
  end

  button_box.add(button)
  win.show_all
end

exit(myapp.run([$PROGRAM_NAME] + ARGV))
