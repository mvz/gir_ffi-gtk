# frozen_string_literal: true

require 'test_helper'

describe Gtk::Button do
  describe '.new_from_icon_name' do
    before do
      skip if Gtk::MAJOR_VERSION == 2 || Gtk::MAJOR_VERSION == 3 && Gtk::MINOR_VERSION < 10
    end

    it 'works when called with a symbol' do
      result = Gtk::Button.new_from_icon_name('hi', :dialog)
      result.must_be_instance_of Gtk::Button
    end

    it 'works when called with an integer' do
      result = Gtk::Button.new_from_icon_name('hi', 4)
      result.must_be_instance_of Gtk::Button
    end
  end
end
