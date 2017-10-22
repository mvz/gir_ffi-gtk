#!/usr/bin/env ruby
#
# Simple notification example.
require 'gir_ffi-gtk3'

GirFFI.setup :Notify

# Both Gtk and Notify need to be init'ed.
Gtk.init
Notify.init "notification test"

# Basic set up of the notification.
nf = Notify::Notification.new "Hello!", "Hi there.", "gtk-dialog-info"
nf.timeout = 3000
nf.urgency = :critical

# Show a button 'Test' in the notification, with a callback function.
nf.add_action("test", "Test") { |obj, action, user_data|
  puts "Action #{action} clicked."
}

# In this case, we want the program to end once the notification is gone,
# but not before.
nf.signal_connect("closed") {
  puts "Notification closed."
  Gtk.main_quit
}

# Show the notification.
nf.show

# Start a main loop to wait for the notification to be closed.
Gtk.main
