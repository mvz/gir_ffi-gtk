# frozen_string_literal: true

require "test_helper"

describe Gtk::Builder do
  let(:builder) { Gtk::Builder.new }
  let(:spec) do
    <<-XML
      <interface>
      <object class="GtkButton" id="foo">
      <signal handler="on_button_clicked" name="clicked"/>
      </object>
      </interface>
    XML
  end

  describe "#add_from_string" do
    it "takes one string as argument" do
      builder.add_from_string spec
      pass
    end
  end

  describe "#connect_signals" do
    before do
      builder.add_from_string spec
    end

    it "passes the handler name to the block" do
      name = nil
      builder.connect_signals do |handler_name|
        name = handler_name
        nil
      end

      _(name).must_equal "on_button_clicked"
    end

    it "connects the signal to the proc returned by the block" do
      name = nil
      builder.connect_signals do |handler_name|
        proc { name = handler_name }
      end
      button = builder.get_object("foo")
      GObject.signal_emit button, "clicked"

      _(name).must_equal "on_button_clicked"
    end

    describe "with a signal with after flag" do
      let(:spec) do
        <<-XML
          <interface>
          <object class="GtkButton" id="foo">
          <signal handler="handler_after" name="clicked" after="true"/>
          <signal handler="handler_before" name="clicked"/>
          </object>
          </interface>
        XML
      end

      it "connects the handlers in the right order" do
        name = nil
        builder.connect_signals do |handler_name|
          proc { name = handler_name }
        end
        button = builder.get_object("foo")
        GObject.signal_emit button, "clicked"

        _(name).must_equal "handler_after"
      end
    end
  end
end
