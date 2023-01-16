# frozen_string_literal: true

require "simplecov"
SimpleCov.start do
  add_group "Main", "lib"
  add_group "Tests", "test"
  enable_coverage :branch
end

require "minitest/autorun"

Thread.abort_on_exception = true

if ENV["GTK_VERSION"] == "2"
  require "gir_ffi-gtk2"
else
  require "gir_ffi-gtk3"
end

module BaseTestExtensions
  def assert_nothing_raised
    yield
  end

  def ref_count(object)
    GObject::Object::Struct.new(object.to_ptr)[:ref_count]
  end
end

Minitest::Test.include BaseTestExtensions

Gtk.init
