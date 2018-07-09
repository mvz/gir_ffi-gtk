require 'test_helper'

# Tests generated methods and functions in the Gtk namespace.
describe 'In the generated Gtk module' do
  describe 'a Gtk::Builder instance' do
    before do
      @builder = Gtk::Builder.new
      @spec = '
        <interface>
        <object class="GtkButton" id="foo">
        <signal handler="on_button_clicked" name="clicked"/>
        </object>
        </interface>
      '
    end

    it 'loads the interface spec' do
      assert_nothing_raised { @builder.add_from_string @spec }
    end

    describe 'its #get_object method' do
      it 'returns objects of the proper class' do
        @builder.add_from_string @spec
        o = @builder.get_object 'foo'
        assert_instance_of Gtk::Button, o
      end
    end

    describe 'its #connect_signals_full method' do
      before do
        @builder.add_from_string @spec
      end
      it 'passes arguments correctly' do
        aa = nil
        @builder.connect_signals_full { |*args| aa = args }
        b, o, sn, hn, co, f, ud = aa
        assert_instance_of Gtk::Builder, b
        assert_equal b.to_ptr, @builder.to_ptr
        assert_instance_of Gtk::Button, o
        assert_equal 'clicked', sn
        assert_equal 'on_button_clicked', hn
        co.must_be_nil
        assert_equal 0, f
        ud.wont_be_nil
      end
    end
  end

  describe 'a Gtk::Window instance' do
    before do
      @w = Gtk::Window.new :toplevel
    end

    it 'starts with a refcount of 2 (one for us, one for GTK+)' do
      assert_equal 2, ref_count(@w)
    end
  end
end
