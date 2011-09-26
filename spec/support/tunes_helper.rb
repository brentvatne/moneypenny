module TunesHelper
  def stub_with_track(opts={})
    opts = {:name => " ", :artist => " "}.merge(opts)
    track = stub(:current_track => stub(opts))
    app_interface = stub
    app_interface.stub(:app) do |options|
      track
    end
    app_interface
  end
end
