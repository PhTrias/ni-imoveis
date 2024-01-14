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
end
