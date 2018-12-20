# frozen_string_literal: true

require 'test_helper'

describe Gtk::Image do
  describe '.new_from_icon_name' do
    it 'works when called with a symbol' do
      result = Gtk::Image.new_from_icon_name('hi', :dialog)
      result.must_be_instance_of Gtk::Image
    end

    it 'works when called with an integer' do
      result = Gtk::Image.new_from_icon_name('hi', 4)
      result.must_be_instance_of Gtk::Image
    end
  end

  describe '.new_from_gicon' do
    let(:gicon) { Gio::ThemedIcon.new('hi') }
    it 'works when called with a symbol' do
      result = Gtk::Image.new_from_gicon(gicon, :dialog)
      result.must_be_instance_of Gtk::Image
    end

    it 'works when called with an integer' do
      result = Gtk::Image.new_from_gicon(gicon, 4)
      result.must_be_instance_of Gtk::Image
    end
  end

  describe '#set_from_gicon' do
    let(:gicon) { Gio::ThemedIcon.new('gnome') }
    let(:image) { Gtk::Image.new }

    it 'works when called with a symbol' do
      image.set_from_gicon(gicon, :dialog)
      image.get_gicon.must_equal [gicon, 6]
    end

    it 'works when called with an integer' do
      image.set_from_gicon(gicon, 4)
      image.get_gicon.must_equal [gicon, 4]
    end
  end
end
