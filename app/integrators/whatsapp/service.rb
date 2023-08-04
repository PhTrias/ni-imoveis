module Whatsapp
  class Service
    def initialize(store)
      @client = Integrators::Whatsapp::Client.new()
    end

    private

    def send_whatsapp_message
      @client.send_message
    end
  end
end
