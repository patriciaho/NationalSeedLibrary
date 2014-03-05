class Seed < ActiveRecord::Base
  has_many :collections
  has_many :libraries, through: :collections

  has_attached_file :harvest_photo, :styles => { :cropped => "", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :plant_photo, :styles => { :cropped => "", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :seed_photo, :styles => { :cropped => "", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  crop_attached_file :harvest_photo, :aspect => "1:1"

  validates_attachment_content_type :harvest_photo, :content_type => /\Aimage\/.*\Z/
  validates :scientific_name, uniqueness: true

  def self.search(search)
    if search
      find(:all, :conditions => ['common_name LIKE ? OR planting_season LIKE ? OR description LIKE ?', "%#{search.capitalize}%", "%#{search.capitalize}%", "%#{search.downcase}%"])
    else
      find(:all)
    end
  end

end