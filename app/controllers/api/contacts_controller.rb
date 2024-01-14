class Api::ContactsController < Api::ApplicationController
  include Authorization::Basic
  include WhatsappMessaging

  before_action :authenticate!
  before_action :set_propertie, only: :create, if: -> { contact_params[:propertie_id].presence }

  def create
    # send_whatsapp_message

    if @service == true
      render json: { successful: true }, status: 200
    else
      render json: { successful: false }, status: 422
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

  # def send_whatsapp_message
  #   contact_params.merge!({ propertie: @propertie.as_json }) if @propertie.present?
#
  #   @service = Whatsapp::Service.new(contact_params).send_message
  # end
end
