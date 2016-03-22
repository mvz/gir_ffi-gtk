if RUBY_PLATFORM == 'java'
  require 'rubygems'
end

begin
  require 'simplecov'
  SimpleCov.start do
    add_filter "/test/"
  end
rescue LoadError
end

require 'minitest/autorun'
require 'rr'

Thread.abort_on_exception = true

if ENV['GTK_VERSION'] == '2'
  require 'gir_ffi-gtk2'
else
  require 'gir_ffi-gtk3'
end

class Minitest::Test
  def assert_nothing_raised
    yield
    assert true
  end

  def ref_count object
    GObject::Object::Struct.new(object.to_ptr)[:ref_count]
  end
end

Gtk.init
