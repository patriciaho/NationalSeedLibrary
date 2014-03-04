class Seed < ActiveRecord::Base
  has_and_belongs_to_many :libraries
  
  validates :scientific_name, uniqueness: true

  def self.search(search)
    if search
      find(:all, :conditions => ['common_name LIKE ? OR planting_season LIKE ? OR description LIKE ?', "%#{search.capitalize}%", "%#{search.capitalize}%", "%#{search.downcase}%"])
    else
      find(:all)
    end
  end

end
