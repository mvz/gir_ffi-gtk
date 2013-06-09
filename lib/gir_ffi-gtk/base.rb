require 'gir_ffi-gtk/menu'

module Gtk
  setup_method "init"

  def self.init_with_auto_argv
    remaining = init_without_auto_argv([$0, *ARGV]).to_a
    remaining.shift
    ARGV.replace remaining
  end
  class << self
    alias init_without_auto_argv init
    alias init init_with_auto_argv
  end
end

Gtk.class_eval do
end

