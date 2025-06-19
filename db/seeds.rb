# db/seeds.rb
m1 = Machine.create!(name: "ラットプルダウン", label: "Lat Pull Down, Pull-down", image_url: "lat.jpg")
m2 = Machine.create!(name: "チェストプレス", label: "Chest Press", image_url: "chest.jpg")
m3 = Machine.create!(name: "フラットベンチ＆ダンベル", label: "Flat Bench, Dumbbell, Free Weights, Bench Press", image_url: "bench.jpg")

menu1 = Menu.create!(name: "背中トレ", part: "背中", machine_id: m1.id)
menu2 = Menu.create!(name: "胸トレ", part: "胸", machine_id: m2.id)
menu3 = Menu.create!(name: "ダンベルプレス", part: "胸", machine_id: m3.id)
menu4 = Menu.create!(name: "サイドレイズ", part: "肩", machine_id: m3.id)

MachineMenu.create!(machine: m1, menu: menu1)
MachineMenu.create!(machine: m1, menu: menu2) # ラットプルダウンで胸トレもできると仮定
MachineMenu.create!(machine: m3, menu: menu3)
MachineMenu.create!(machine: m3, menu: menu4)

User.create!(
  id: 1,
  name: "テストユーザー",
  email: "test@example.com",
  password: "password"
)