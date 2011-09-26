require 'rbosa'

module Moneypenny
  module Plugins
    module Responders
      class Tunes < Responder
        def self.default_config
          { }
        end

        def help
          ["string 1","string 2"]
        end

        def get_itunes_connection(opts={})
          opts = {:remote_machine => nil, :interface_class => OSA}.merge(opts)
          @app ||= opts[:interface_class].app(:name => 'iTunes', :machine => opts[:remote_machine])
        end

        def itunes
          @app || get_itunes_connection
        end

        def respond(message)
          case message
          when /^what song is this\?$/i #assigned to name
            itunes.current_track.name + " by " + itunes.current_track.artist
          else
            false
          end
        end

        # private
        #   def do_something

        #   end

        #   def issue_response

        #   end
        # end
      end
    end
  end
end
