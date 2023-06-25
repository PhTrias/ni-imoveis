class ContactsController < ApplicationController
  include WhatsappMessaging

  before_action :initialize_messaging_client, only: :create
  before_action :set_propertie, only: :create, if: -> { contact_params[:propertie_id].presence }

  def create
    if send_business_whatsapp_message != 201
      render json: { successful: true }, status: 200
    else
      resnder json: { successful: false }, status: 422
    end
  end

  private

  def contact_params
    params.permit(
      :name,
      :phone,
      :message_type,
      :propertie_id
    )
  end

  def set_propertie
    @propertie = Propertie.find(contact_params[:propertie_id])

    render json: { error: I18n.t('api.properties.not_found') }, status: 404 unless @propertie.present?
  end

  def initialize_messaging_client
    @client = Twilio::REST::Client.new(ENV.fetch('TWILIO_ACCOUNT_SID', ''), ENV.fetch('TWILIO_AUTH_TOKEN', ''))
  end

  # Bussines -> customer contact
  def send_business_whatsapp_message
    response = @client.messages.create(
      body: send(contact_params[:message_type]),
      from: "whatsapp:#{ENV['COMPANY_WHATSAPP_CONTACT']}",
      to: "whatsapp:#{contact_params[:phone]}"
    )

    response.code
  end
end
