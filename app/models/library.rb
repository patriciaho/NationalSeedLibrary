class Library < ActiveRecord::Base
  has_many :collections
  has_many :seeds, through: :collections

  accepts_nested_attributes_for :seeds

  geocoded_by :address
  after_validation :geocode 

  validates :name, presence: true
  validates :address, presence: true
end
