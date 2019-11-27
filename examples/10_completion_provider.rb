# frozen_string_literal: true

require "gir_ffi-gtk3"

# This is an example of creating a derived class with vfunc implementations.

GirFFI.setup :GtkSource

Gtk.init

# Test implementation of the GtkSource::CompletionProvider interface.
class TestProvider < GObject::Object
  include GtkSource::CompletionProvider

  def get_name
    "Test Provider"
  end

  def get_priority
    1
  end

  def match(_context)
    true
  end

  def populate(context)
    icon = Gtk::IconTheme.get_default.load_icon(Gtk::STOCK_DIALOG_INFO, 16, 0)

    proposals = [
      GtkSource::CompletionItem.new("Proposal 1", "Proposal 1", icon, "blah 1"),
      GtkSource::CompletionItem.new("Proposal 2", "Proposal 2", icon, "blah 2"),
      GtkSource::CompletionItem.new("Proposal 3", "Proposal 3", icon, "blah 3")
    ]
    context.add_proposals(self, proposals, true)
  end
end

GirFFI.define_type TestProvider do |info|
  info.install_vfunc_implementation :get_name
  info.install_vfunc_implementation :get_priority
  info.install_vfunc_implementation :match
  info.install_vfunc_implementation :populate
end

win = Gtk::Window.new :toplevel
win.show
GObject.signal_connect(win, "destroy") { Gtk.main_quit }

vbox = Gtk::VBox.new(false, 0)
win.add vbox

lm = GtkSource::LanguageManager.get_default
lang = lm.get_language "ruby"
buffer = GtkSource::Buffer.new_with_language lang
@source = GtkSource::View.new_with_buffer buffer

test_provider = TestProvider.new
completion = @source.get_completion
completion.add_provider test_provider

vbox.pack_start @source, true, true, 0

win.show_all
Gtk.main
