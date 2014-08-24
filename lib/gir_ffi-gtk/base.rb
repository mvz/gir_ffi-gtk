module GirFFIGtk
  # Override init to automatically use ARGV as its argument.
  module AutoArgv
    def self.included base
      base.extend ClassMethods
      class << base
        alias_method :init_without_auto_argv, :init
        alias_method :init, :init_with_auto_argv
      end
    end

    module ClassMethods
      def init_with_auto_argv
        remaining = init_without_auto_argv([$PROGRAM_NAME, *ARGV]).to_a
        remaining.shift
        ARGV.replace remaining
      end
    end
  end

  # Override main to start an idle thread to allow Ruby threads to run during
  # the main loop.
  module ThreadEnabler
    def self.included base
      base.extend ClassMethods
      class << base
        alias_method :main_without_thread_enabler, :main
        alias_method :main, :main_with_thread_enabler
      end
    end

    module ClassMethods
      def main_with_thread_enabler
        case RUBY_ENGINE
        when 'jruby'
        when 'rbx'
        else # 'ruby' most likely
          GLib::MainLoop::ThreadEnabler.instance.setup_idle_handler
        end
        main_without_thread_enabler
      end
    end
  end
end

# Overrides for Gtk module functions
module Gtk
  setup_method "init"
  setup_method "main"

  include GirFFIGtk::AutoArgv
  include GirFFIGtk::ThreadEnabler
end
