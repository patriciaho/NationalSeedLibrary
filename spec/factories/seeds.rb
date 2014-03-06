FactoryGirl.define do
  factory :seed do
    common_name 'Tomato'
    sequence(:scientific_name) { |n| "Solanum lycopersicum#{n}" }
    planting_season 'Spring'
    description 'The species originated in the South American Andes and its use as a food originated in Mexico, and spread throughout the world following the Spanish colonization of the Americas. Its many varieties are now widely grown, sometimes in greenhouses in cooler climates.'
    quantity 100
    harvest_photo File.new("#{Rails.root}/spec/files/Tomato.jpg")
  end
end