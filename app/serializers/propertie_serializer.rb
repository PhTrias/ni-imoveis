class PropertieSerializer < ActiveModel::Serializer
  attributes %i[
    id
    business_type
    value
    iptu
    condominium
    size
    rooms
    zone
    address
    number
    neighborhood
    complement
    cep
    full_price
    description
    bathrooms
    car_spaces
    floors
    furnished
    subway_close
    pet_friendly
    pictures
  ]

  def business_type
    {label: I18n.t("propertie.business_type"), value: object.business_type }
  end

  def value
    {label: I18n.t("propertie.value"), value: object.value }
  end

  def iptu
    {label: I18n.t("propertie.iptu"), value: object.iptu }
  end

  def condominium
    {label: I18n.t("propertie.condominium"), value: object.condominium }
  end

  def size
    {label: I18n.t("propertie.size"), value: object.size }
  end

  def rooms
    {label: I18n.t("propertie.rooms"), value: object.rooms }
  end

  def zone
    {label: I18n.t("propertie.zone"), value: object.zone }
  end

  def address
    {label: I18n.t("propertie.address"), value: object.address }
  end

  def number
    {label: I18n.t("propertie.number"), value: object.number }
  end

  def neighborhood
    {label: I18n.t("propertie.neighborhood"), value: object.neighborhood }
  end

  def complement
    {label: I18n.t("propertie.complement"), value: object.complement }
  end

  def cep
    {label: I18n.t("propertie.cep"), value: object.cep }
  end

  def full_price
    {label: I18n.t("propertie.full_price"), value: object.full_price }
  end
  def description
    {label: I18n.t("propertie.description"), value: object.description }
  end

  def pictures
    {label: I18n.t("propertie.pictures"), value: object.pictures }
  end

  def bathrooms
    {label: I18n.t("propertie.bathrooms"), value: object.bathrooms }
  end

  def car_spaces
    {label: I18n.t("propertie.car_spaces"), value: object.car_spaces }
  end

  def floors
    {label: I18n.t("propertie.floors"), value: object.floors }
  end

  def furnished
    {label: I18n.t("propertie.furnished"), value: object.furnished }
  end

  def subway_close
    {label: I18n.t("propertie.subway_close"), value: object.subway_close }
  end

  def pet_friendly
    {label: I18n.t("propertie.pet_friendly"), value: object.pet_friendly }
  end

end
