class Library < ActiveRecord::Base
  has_and_belongs_to_many :seeds

  geocoded_by :address
  after_validation :geocode 

  validates :name, presence: true
  validates :address, presence: true
end
