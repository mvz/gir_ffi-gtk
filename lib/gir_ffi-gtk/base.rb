# Overrides for Gtk module functions
module GirFFIGtk
  module AutoArgv
    def self.included base
      base.extend ClassMethods
      class << base;
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

  module ThreadEnabler
    def self.included base
      base.extend ClassMethods
      class << base;
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

module Gtk
  setup_method "init"
  setup_method "main"

  include GirFFIGtk::AutoArgv
  include GirFFIGtk::ThreadEnabler
end
