class ContactsController < ApplicationController
  include WhatsappMessaging

  before_action :set_propertie, only: :create, if: -> { contact_params[:propertie_id].presence }

  def create
    send_whatsapp_message

    binding.pry
    if @service == true
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

  def send_whatsapp_message
    binding.pry
    contact_params.merge!({ propertie: @propertie.as_json }) if @propertie.present?

    @service = Whatsapp::Service.new(contact_params).send_message
  end
end
