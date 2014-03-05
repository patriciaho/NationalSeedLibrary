# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Library.destroy_all
Seed.destroy_all

libraries = Library.create([{ name: 'SLOLA', address: '13000 Venice Blvd., Los Angeles, CA 90066' },
                            { name: 'Petaluma Seed Bank', address: '199 Petaluma Blvd., North Petaluma, CA 94952'},
                            { name: 'Baker Creek Heirloom Seeds', address: '2278 Baker Creek Road Mansfield, MO 65704'},
                            { name: 'Bountiful Gardens', address: '18001 Shafer Ranch Road, Willits, CA 95490'},
                            { name: 'FEDCO', address: 'PO Box 520, Waterville, ME 04903'},
                            { name: 'Peaceful Valley Farm Supply', address: 'PO Box 2209, Grass Valley, CA 94945'},
                            { name: 'Native Seed/Search', address: '526 N. 4th Ave., Tucson, AZ 85705'},
                            { name: 'Pinetree Garden Seeds', address: 'PO Box 300, Rt. 100, New Gloucester, MY 04260'},
                            { name: 'Seed Savers Exchange', address: 'Rt. 3 Box 239, Decorah, Iowa 52101'},
                            { name: 'Southern Exposure Seed Exchange', address: 'PO Box 460, Mineral, VA 23117'}
                            ])

seeds = Seed.create([{ common_name: 'Tomato', scientific_name: 'Solanum lycopersicum', planting_season: 'Spring', description: 'The tomato is the edible, often red fruit/berry of the nightshade Solanum lycopersicum, commonly known as a tomato plant. The species originated in the South American Andes and its use as a food originated in Mexico. And they are so yummy, I could eat one every day. What do you think? How about you get some seeds. Like now.', quantity: 236, harvest_photo_file_name: 'Tomato2.jpg' },
                     { common_name: 'Strawberry', scientific_name: 'Strawberry lycopersicum', planting_season: 'Summer', description: 'Truly delicious and appetizing! And red, and seeded', quantity: 236, harvest_photo_file_name: 'Tomato2.jpg' },
                     { common_name: 'Grapes', scientific_name: 'Grapes lycopersicum', planting_season: 'Winter', description: 'Grapes are so yummy, and you can make wine with them!', quantity: 236, harvest_photo_file_name: 'Tomato2.jpg' },
                     { common_name: 'Oranges', scientific_name: 'Oranges lycopersicum', planting_season: 'Fall', description: 'If you want juice, there is nothing better than orange juice. So refreshing! And easy to grow.', quantity: 236, harvest_photo_file_name: 'Tomato2.jpg' },
                     { common_name: 'Watermelon', scientific_name: 'Watermelon lycopersicum', planting_season: 'Fall', description: 'Lots of seeds, but you can just spit them out. Also red color.', quantity: 236, harvest_photo_file_name: 'Tomato2.jpg' }

       ])

