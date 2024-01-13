class Propertie < ApplicationRecord
  serialize :pictures, Array
  
  validates :business_type, presence: true
  validates :value, presence: true
  validates :size, presence: true
  validates :address, presence: true
  validates :cep, presence: true
  validates :neighborhood, presence: true

  before_save :set_full_price

  def full_price_sum
    self.full_price = iptu + condominium + value
  end

  def calculate_full_price
    value + iptu + condominium
  end

  def set_full_price
    return unless full_price != calculate_full_price

    self.full_price = calculate_full_price
  end
end
