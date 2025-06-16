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
m1 = Machine.create!(name: "ラットプルダウン", label: "Weightlifting Machine", image_url: "lat.jpg")
m2 = Machine.create!(name: "チェストプレス", label: "Weightlifting Machine", image_url: "chest.jpg")

menu1 = Menu.create!(name: "背中トレ", part: "背中", count: 10, set_count: 3, weight: 40, machine_id: m1.id)
menu2 = Menu.create!(name: "胸トレ", part: "胸", count: 12, set_count: 3, weight: 30, machine_id: m2.id)

MachineMenu.create!(machine: m1, menu: menu1)
MachineMenu.create!(machine: m1, menu: menu2) # ラットプルダウンで胸トレもできると仮定

User.find_or_create_by!(email: "test3@example.com") do |user|
  user.name = "テストユーザー"
  user.password = "password"
end

machine_names = [
  "ベンチプレス台",
  "ラットプルマシン",
  "レッグプレスマシン",
  "スミスマシン",
  "ショルダープレスマシン",
  "ケーブルクロスマシン",
  "ペックデック",
  "アームカールマシン",
  "レッグエクステンション",
  "ヒップスラストマシン",
  "腹筋ローラー",
  "トレッドミル",
  "ローイングマシン"
]

machine_names.each do |name|
  Machine.find_or_create_by(name: name)
end

menu_seeds = [
  { name: "ベンチプレス", part: "胸", machine_name: "ベンチプレス台" },
  { name: "ラットプルダウン", part: "背中", machine_name: "ラットプルマシン" },
  { name: "レッグプレス", part: "脚", machine_name: "レッグプレスマシン" },
  { name: "スミスマシンスクワット", part: "脚", machine_name: "スミスマシン" },
  { name: "ショルダープレス", part: "肩", machine_name: "ショルダープレスマシン" },
  { name: "ケーブルクロス", part: "胸", machine_name: "ケーブルクロスマシン" },
  { name: "ペックデック", part: "胸", machine_name: "ペックデック" },
  { name: "アームカール", part: "腕", machine_name: "アームカールマシン" },
  { name: "レッグエクステンション", part: "脚", machine_name: "レッグエクステンション" },
  { name: "ヒップスラスト", part: "お尻", machine_name: "ヒップスラストマシン" },
  { name: "腹筋ローラー", part: "腹筋", machine_name: "腹筋ローラー" },
  { name: "トレッドミル走", part: "有酸素", machine_name: "トレッドミル" },
  { name: "ローイング", part: "背中", machine_name: "ローイングマシン" }
]

menu_seeds.each do |menu_data|
  machine = Machine.find_by(name: menu_data[:machine_name])
  unless machine
    puts "Machine not found: #{menu_data[:machine_name]}"
    next
  end

  Menu.find_or_create_by!(
    name: menu_data[:name],
    part: menu_data[:part],
    machine_id: machine.id,
    count: nil,
    set_count: nil,
    time: nil
  )
end