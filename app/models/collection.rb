class Collection < ActiveRecord::Base
  belongs_to :library
  belongs_to :seed
end
