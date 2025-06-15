# frozen_string_literal: true

require "gir_ffi"

GirFFI.setup :Gtk, "3.0"

raise "Unexpected major Gtk+ version #{Gtk::MAJOR_VERSION}" if Gtk::MAJOR_VERSION != 3
raise "Gtk+ version 3.#{Gtk::MINOR_VERSION} is not supported" if Gtk::MINOR_VERSION < 12

require "gir_ffi-gtk/base"
require "gir_ffi-gtk/version"

require "gir_ffi-gtk/action"
require "gir_ffi-gtk/builder"
require "gir_ffi-gtk/container"
require "gir_ffi-gtk/dialog"
require "gir_ffi-gtk/file_chooser_dialog"
require "gir_ffi-gtk/image"
require "gir_ffi-gtk/list_store"
require "gir_ffi-gtk/message_dialog"
require "gir_ffi-gtk/tree_store"
require "gir_ffi-gtk/tree_view_column"
require "gir_ffi-gtk/widget"

require "gir_ffi-gtk/gtk3/button"
require "gir_ffi-gtk/gtk3/target_entry"
