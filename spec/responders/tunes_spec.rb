describe Moneypenny::Plugins::Responders::Tunes do
  include TunesHelper

  before :each do
    moneypenny = new_moneypenny_instance
    @tunes = Moneypenny::Plugins::Responders::Tunes.new moneypenny
  end

  describe 'help' do
    it 'should return an Array with two Strings' do
      @tunes.help.should be_an_kind_of Array
      @tunes.help.size.should be 2
      @tunes.help[0].should be_a_kind_of String
      @tunes.help[1].should be_a_kind_of String
    end
  end

  describe 'respond' do
    context 'given a message that it understands' do
      it "should respond to 'what song is this?'" do
        stubbed_interface = stub_with_track :name => "some song", :artist => "artist"
        @tunes.get_itunes_connection(:interface_class => stubbed_interface)
        @tunes.respond("what song is this?").should match /some song .* artist/
      end
    end

    context 'given a message that it does not recognize' do
      it 'should return false' do
        message = stub 'message'
        @tunes.respond(message).should be_false
      end
    end
  end
end
