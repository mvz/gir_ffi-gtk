if RUBY_PLATFORM == 'java'
  require 'rubygems'
end

if RUBY_VERSION >= "1.9" and ENV["SIMPLECOV"]
  require 'simplecov'
  SimpleCov.start
end

require 'minitest/autorun'
require 'rr'

Thread.abort_on_exception = true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'gir_ffi-gtk3'

class Minitest::Test
  include RR::Adapters::TestUnit

  def assert_nothing_raised
    yield
    assert true
  end

  def ref_count object
    GObject::Object::Struct.new(object.to_ptr)[:ref_count]
  end

  SAVED_MODULES = {}

  def save_module name
    if Object.const_defined? name
      puts "Saving #{name} over existing" if SAVED_MODULES.has_key? name
      SAVED_MODULES[name] = Object.const_get name
      Object.send(:remove_const, name)
    end
  end

  def restore_module name
    if Object.const_defined? name
      Object.send(:remove_const, name)
    end
    if SAVED_MODULES.has_key? name
      Object.const_set name, SAVED_MODULES[name]
      SAVED_MODULES.delete name
    end
  end
end
