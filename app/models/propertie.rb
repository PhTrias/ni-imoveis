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

  scope :by_business_type, ->(business_type) { where(business_type: business_type) if business_type.present? }
  scope :by_value, ->(value) { where(value: value) if value.present? }
  scope :by_value_range, ->(min, max) { where(value: min..max) if min.present? && max.present? }
  scope :by_size, ->(size) { where(size: size) if size.present? }
  scope :by_size_range, ->(min, max) { where(size: min..max) if min.present? && max.present? }
  scope :by_rooms, ->(rooms) { where(rooms: rooms) if rooms.present? }
  scope :by_zone, ->(zone) { where(zone: zone) if zone.present? }
  scope :by_neighborhood, ->(neighborhood) { where(neighborhood: neighborhood) if neighborhood.present? }
  scope :by_complement, ->(complement) { where(complement: complement) if complement.present? }
  scope :by_full_price, ->(full_price) { where(full_price: full_price) if full_price.present? }
end
