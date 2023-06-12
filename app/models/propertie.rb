class Propertie < ApplicationRecord
  validates :business_type, presence: true
  validates :value, presence: true
  validates :size, presence: true
  validates :address, presence: true
  validates :cep, presence: true
  validates :neighborhood, presence: true

  def full_price_sum
    self.full_price = iptu + condominium + value
  end
end
