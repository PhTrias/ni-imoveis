module Whatsapp
  class Client
    include HTTParty
    include WhatsappMessaging

    base_uri "https://graph.facebook.com/v17.0"

    def initialize(params)
      # params:
      #   name
      #   phone
      #   message_type
      #   propertie_id
      #   propertie -> if customer call message from a propertie page!

      @customer_name = params[:name]
      @customer_phone = params[:phone]
      @message_type = params[:message_type]
      @propertie = params[:propertie].presence
      @account_code = ENV["WHATSAPP_ACCOUNT_CODE"]
    end

    private

    def send_message
      self.class.post("/#{@account_code}/messages", options)
    end

    def options
      {
        headers: headers,
        body: send_message_body
      }
    end

    def headers
      {
        'Content-Type': 'application/json',
        'Authorization': "Bearer #{ENV['WHATSAPP_TOKEN']}"
      }
    end

    def send_message_body
      {
        "messaging_product": "whatsapp",
        "to": @customer_phone,
        "type": "text",
        "text": {
          "body": @message
        },
        "language": {
          "code": "pt_BR"
        }
      }
    end
  end
end
