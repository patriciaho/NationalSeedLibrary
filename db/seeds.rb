# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Library.destroy_all

libraries = Library.create([{ name: 'SLOLA', address: '13000 Venice Blvd., 90066' },
                            { name: 'Petaluma Seed Bank', address: '199 Petaluma Blvd., North Petaluma, CA 94952'

  }])