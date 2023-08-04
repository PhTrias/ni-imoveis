class Api::PropertiesController < Api::ApplicationController
  include Authorization::ApiToken

  before_action :set_propertie, only: %i[show edit update]

  def index
    @properties = Propertie.all

    render(
      json: @properties,
      each_serializer: PropertieSerializer,
      meta: pagination_meta(@properties)
    )
  end

  def show
    render json: @propertie, status: :ok
  end

  def update
    if @propertie.update(propertie_params)
      render json: :ok
    else
      render json: :unprocessable_entity
    end
  end

  private

  def set_propertie
    @propertie = Propertie.find(params[:id])
  end

  def propertie_params
    params.permit(
      :business_type,
      :value,
      :iptu,
      :condominium,
      :size,
      :rooms,
      :zone,
      :address,
      :number,
      :neighborhood,
      :complement,
      :cep,
      :full_price
    )
  end
end

