require 'test_helper'

describe Gtk::Builder do
  let(:builder) { Gtk::Builder.new }
  let(:spec) do
    <<-EOS
      <interface>
      <object class="GtkButton" id="foo">
      <signal handler="on_button_clicked" name="clicked"/>
      </object>
      </interface>
    EOS
  end

  describe "#add_from_string" do
    it 'takes one string as argument' do
      builder.add_from_string spec
      pass
    end
  end
end
