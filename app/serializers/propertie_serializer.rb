class PropertieSerializer < ActiveModel::Serializer
  attributes %i[id business_type value iptu condominium size rooms zone address number neighborhood complement cep full_price]
end
