json.seed do |json|
  json.extract! @seed, :common_name, :description, :scientific_name, :quantity, :planting_season
end