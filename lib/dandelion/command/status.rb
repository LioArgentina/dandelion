module Dandelion
  module Command
    class Status < Command::Base
      command 'status'
  
      class << self
        def parser(options)
          OptionParser.new do |opts|
            opts.banner = 'Usage: dandelion status'
          end
        end
      end
  
      def execute
        @deployment = deployment('HEAD')
        log.info("New version local")       

        file = File.new("/root/amazon_buyman/js/f/bcore_min.js","rb")
	num = file.read(2).unpack("H4")[0]
	puts num
	if num == "1f8b"
		puts "comprimido!"
	else
		puts "No comp."
 	end

        log.info("Remote revision2:       #{@deployment.remote_revision || '---'}")
        log.info("Local HEAD revision:   #{@deployment.local_revision}")
      end
    end
  end
end
