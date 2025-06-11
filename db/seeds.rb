# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
m1 = Machine.create!(name: "ラットプルダウン", image_url: "lat.jpg")
m2 = Machine.create!(name: "チェストプレス", image_url: "chest.jpg")

menu1 = Menu.create!(name: "背中トレ", part: "背中", count: 10, set_count: 3, weight: 40, machine_id: m1.id)
menu2 = Menu.create!(name: "胸トレ", part: "胸", count: 12, set_count: 3, weight: 30, machine_id: m2.id)

MachineMenu.create!(machine: m1, menu: menu1)
MachineMenu.create!(machine: m1, menu: menu2) # ラットプルダウンで胸トレもできると仮定
