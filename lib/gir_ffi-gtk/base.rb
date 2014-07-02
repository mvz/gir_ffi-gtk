# Overrides for Gtk module functions
module Gtk
  setup_method "init"

  def self.init_with_auto_argv
    remaining = init_without_auto_argv([$PROGRAM_NAME, *ARGV]).to_a
    remaining.shift
    ARGV.replace remaining
  end

  class << self
    alias_method :init_without_auto_argv, :init
    alias_method :init, :init_with_auto_argv
  end
end
