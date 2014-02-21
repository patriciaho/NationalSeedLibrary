class Seed < ActiveRecord::Base
  has_and_belongs_to_many :libraries
  
  validates :scientific_name, uniqueness: true
end
