class Api::PropertiesController < Api::ApplicationController
  include Authorization::Basic

  before_action :authenticate!
  before_action :set_propertie, only: %i[show edit update]

  def index
    @properties = Propertie
      .active
      .by_rooms(filter_params[:rooms])
      .by_car_spaces(filter_params[:car_spaces])
      .by_business_type(filter_params[:business_type])
      .by_neighborhood(filter_params[:neighborhood])
      .by_value_range(filter_params[:min_value], filter_params[:max_value])
      .by_size_range(filter_params[:min_size], filter_params[:max_size])
      .page(filter_params[:page] || 1)
      .per(filter_params[:per_page] || 8)

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

  def create
    propertie = Propertie.new(propertie_params)

    if propertie.save
      render(
        json: propertie,
        adapter: :json,
        serializer: PropertieSerializer,
      )
    else
      render json: { successful: false, message: "Erro ao criar imóvel. Erro #{propertie.errors}" }
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
      :full_price,
      :description,
      pictures: []
    )
  end

  def filter_params
    params.permit(
      :business_type,
      :neighborhood,
      :min_value,
      :max_value,
      :min_size,
      :max_size,
      :rooms,
      :car_spaces
    )
  end
end

