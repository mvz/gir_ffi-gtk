# Overrides for Gtk module functions
module GirFFIGtk
  module BaseOverrides
    def self.included base
      base.extend BaseClassOverrides
      class << base;
        alias_method :init_without_auto_argv, :init
        alias_method :init, :init_with_auto_argv
      end
    end
  end

  module BaseClassOverrides
    def init_with_auto_argv
      remaining = init_without_auto_argv([$PROGRAM_NAME, *ARGV]).to_a
      remaining.shift
      ARGV.replace remaining
    end
  end
end

module Gtk
  setup_method "init"

  include GirFFIGtk::BaseOverrides
end
