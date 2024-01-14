class Api::PropertiesController < Api::ApplicationController
  include Authorization::Basic

  before_action :authenticate!
  before_action :set_propertie, only: %i[show edit update]

  def index
    @properties = Propertie
      .by_business_type(params[:business_type])
      .by_value(params[:value])
      .by_iptu(params[:iptu])
      .by_condominium(params[:condominium])
      .by_size(params[:size])
      .by_rooms(params[:rooms])
      .by_zone(params[:zone])
      .by_address(params[:address])
      .by_number(params[:number])
      .by_neighborhood(params[:neighborhood])
      .by_complement(params[:complement])
      .by_cep(params[:cep])
      .by_full_price(params[:full_price])

    render(
      json: @properties,
      adapter: :json,
      each_serializer: PropertieSerializer,
      meta: pagination_meta(@properties)
    )
  end

  def show
    render json: @propertie, status: :ok
  end

  def update
    if @propertie.update(propertie_params)
      render(
        json: @propertie,
        adapter: :json,
        serializer: PropertieSerializer,
      )
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

