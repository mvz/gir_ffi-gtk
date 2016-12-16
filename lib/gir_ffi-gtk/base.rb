module GirFFIGtk
  # Override init to automatically use ARGV as its argument.
  module AutoArgv
    def self.included(base)
      base.extend ClassMethods
      class << base
        alias_method :init_without_auto_argv, :init
        alias_method :init, :init_with_auto_argv
      end
    end

    # Implementation of class methods for AutoArgv
    module ClassMethods
      def init_with_auto_argv
        remaining = init_without_auto_argv([$PROGRAM_NAME, *ARGV]).to_a
        remaining.shift
        ARGV.replace remaining
      end
    end
  end

  # Override main to start an idle thread to allow Ruby threads to run during
  # the main loop, and to handle exceptions
  module MainLoopOverride
    # Class to represent a loop-like interface to the main loop exception
    # handing interface in GLib::MainLoop.
    class DummyLoop
      def quit
        Gtk.main_quit
      end
    end

    def self.included(base)
      base.extend ClassMethods
      class << base
        alias_method :main_without_override, :main
        alias_method :main, :main_with_override
      end
    end

    # Implementation of class methods for MainLoopOverride
    module ClassMethods
      def main_with_override
        if RUBY_ENGINE == 'ruby'
          GLib::MainLoop::ThreadEnabler.instance.setup_idle_handler
        end
        GLib::MainLoop::RUNNING_LOOPS << DummyLoop.new
        result = main_without_override
        ex = GLib::MainLoop::EXCEPTIONS.shift
        GLib::MainLoop::RUNNING_LOOPS.pop
        raise ex if ex
        result
      end
    end
  end
end

# Overrides for Gtk module functions
module Gtk
  setup_method 'init'
  setup_method 'main'

  include GirFFIGtk::AutoArgv
  include GirFFIGtk::MainLoopOverride
end
