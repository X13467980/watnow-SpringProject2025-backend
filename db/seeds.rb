m1 = Machine.create!(name: "インクラインベンチ", label: "Incline Bench, Adjustable Bench, Incline, Decline", image_url: "")
m2 = Machine.create!(name: "ダンベル", label: "Rubber Dumbbell, Dumbbell, dumbbell", image_url: "")
m3 = Machine.create!(name: "パワーラック", label: "Power Rack, Shelf", image_url: "")
m4 = Machine.create!(name: "プリーチャーカールベンチ", label: "Preacher Curl Bench", image_url: "")
m5 = Machine.create!(name: "レッグプレス", label: "Leg Press", image_url: "")
m6 = Machine.create!(name: "アップライトバイク", label: "Treadmill", image_url: "")
m7 = Machine.create!(name: "フラットベンチ", label: "Flat Bench", image_url: "")
m8 = Machine.create!(name: "EZバー", label: "EZ Bar, Cylinder, Pipe", image_url: "")
m9 = Machine.create!(name: "アブコースター", label: "Ab Coaster, Balance", image_url: "")
m10 = Machine.create!(name: "シットアップベンチ", label: "Sit Up Bench", image_url: "")
m11 = Machine.create!(name: "アジャスタブルプーリー", label: "Adjustable Pulley, Ceiling", image_url: "")
m12 = Machine.create!(name: "バーベル", label: "Barbell", image_url: "")
m13 = Machine.create!(name: "チェストプレス", label: "Chest Press", image_url: "")
m14 = Machine.create!(name: "トレッドミル", label: "Treadmill", image_url: "")
m15 = Machine.create!(name: "ペックデック", label: "Pec Deck", image_url: "")

# Menus related to Incline Bench
menu1 = Menu.create!(name: "ダンベルフライ", part: "胸（大胸筋）", machine_id: m1.id)
menu2 = Menu.create!(name: "ダンベルプレス", part: "胸（大胸筋）", machine_id: m1.id)
menu3 = Menu.create!(name: "ワンハンドローイング", part: "背中（広背筋・僧帽筋）", machine_id: m1.id)
menu4 = Menu.create!(name: "ダンベルショルダープレス", part: "肩（三角筋）", machine_id: m1.id)
menu5 = Menu.create!(name: "シーテッドサイドレイズ", part: "肩（三角筋）", machine_id: m1.id)
menu6 = Menu.create!(name: "インクラインダンベルカール", part: "腕（上腕二頭筋）", machine_id: m1.id)
menu7 = Menu.create!(name: "オーバーヘッドダンベルエクステンション", part: "腕（上腕三頭筋）", machine_id: m1.id)
menu8 = Menu.create!(name: "ベンチディップ", part: "腕（上腕三頭筋）", machine_id: m1.id)
menu9 = Menu.create!(name: "ブルガリアンスクワット", part: "脚（大腿四頭筋・ハムストリングス）", machine_id: m1.id)
menu10 = Menu.create!(name: "ライイングレッグカール", part: "脚（ハムストリングス）", machine_id: m1.id)
menu11 = Menu.create!(name: "ステップアップ", part: "脚", machine_id: m1.id)
menu12 = Menu.create!(name: "ヒップスラスト", part: "尻（大臀筋）", machine_id: m1.id)
menu13 = Menu.create!(name: "グルートブリッジ", part: "尻（大臀筋）", machine_id: m1.id)
menu14 = Menu.create!(name: "レッグレイズ", part: "腹筋（腹直筋）", machine_id: m1.id)
menu15 = Menu.create!(name: "シットアップ", part: "腹筋（腹直筋）", machine_id: m1.id)

# Menus related to Dumbbell
menu16 = Menu.create!(name: "ダンベルベンチプレス", part: "胸（大胸筋）", machine_id: m2.id)
menu17 = Menu.create!(name: "ダンベルフライ", part: "胸（大胸筋）", machine_id: m2.id)
menu18 = Menu.create!(name: "ダンベルカール", part: "腕（上腕二頭筋）", machine_id: m2.id)
menu19 = Menu.create!(name: "フレンチプレス", part: "腕（上腕三頭筋）", machine_id: m2.id)
menu20 = Menu.create!(name: "ダンベルハンマーカール", part: "腕（前腕）", machine_id: m2.id)
menu21 = Menu.create!(name: "ダンベルリストカール", part: "腕（前腕）", machine_id: m2.id)
menu22 = Menu.create!(name: "ダンベルシュラッグ", part: "肩（僧帽筋）", machine_id: m2.id)
menu23 = Menu.create!(name: "ダンベルアップライトロウ", part: "肩（三角筋・僧帽筋）", machine_id: m2.id)
menu24 = Menu.create!(name: "ダンベルサイドレイズ", part: "肩（三角筋）", machine_id: m2.id)
menu25 = Menu.create!(name: "ダンベルショルダープレス", part: "肩（三角筋）", machine_id: m2.id)
menu26 = Menu.create!(name: "ダンベルベントオーバーロウ", part: "背中（広背筋）", machine_id: m2.id)
menu27 = Menu.create!(name: "ダンベルデッドリフト", part: "背中・脚・尻（広背筋・ハムストリングス・大臀筋）", machine_id: m2.id)
menu28 = Menu.create!(name: "ダンベルクランチ", part: "腹筋（上部）", machine_id: m2.id)
menu29 = Menu.create!(name: "ダンベルレッグレイズ", part: "腹筋（腹直筋下部）", machine_id: m2.id)
menu30 = Menu.create!(name: "ダンベルスクワット", part: "尻（大臀筋）", machine_id: m2.id)
menu31 = Menu.create!(name: "ダンベルヒップスラスト", part: "尻（大臀筋）", machine_id: m2.id)
menu32 = Menu.create!(name: "ダンベルワイドスクワット", part: "脚（大腿四頭筋）", machine_id: m2.id)
menu33 = Menu.create!(name: "ブルガリアンスクワット", part: "脚（大腿四頭筋・ハムストリングス）", machine_id: m2.id)
menu34 = Menu.create!(name: "ダンベルレッグランジ", part: "脚（ハムストリングス）", machine_id: m2.id)
menu35 = Menu.create!(name: "ダンベルサイドランジ", part: "脚（ハムストリングス）", machine_id: m2.id)
menu36 = Menu.create!(name: "ダンベルカーフレイズ", part: "脚（腓腹筋・ヒラメ筋）", machine_id: m2.id)
menu37 = Menu.create!(name: "ダンベルステーショナリーランジ", part: "脚（腓腹筋・ヒラメ筋・ハムストリングス）", machine_id: m2.id)

# Menus related to Power Rack
menu38 = Menu.create!(name: "ベンチプレス", part: "胸（大胸筋）", machine_id: m3.id)
menu39 = Menu.create!(name: "インクラインベンチプレス", part: "胸（大胸筋）", machine_id: m3.id)
menu40 = Menu.create!(name: "ショルダープレス", part: "肩（三角筋）", machine_id: m3.id)
menu41 = Menu.create!(name: "ベントオーバーロウ", part: "背中（広背筋・僧帽筋）", machine_id: m3.id)
menu42 = Menu.create!(name: "アップライトロウ", part: "肩（三角筋・僧帽筋）", machine_id: m3.id)
menu43 = Menu.create!(name: "デッドリフト", part: "背中・脚・尻（広背筋・ハムストリングス・大臀筋）", machine_id: m3.id)
menu44 = Menu.create!(name: "スクワット", part: "脚・尻（大腿四頭筋・ハムストリングス・大臀筋）", machine_id: m3.id)
menu45 = Menu.create!(name: "チンニング", part: "背中・腕・胸（広背筋・上腕二頭筋・大胸筋）", machine_id: m3.id)

# Menus related to Preacher Curl Bench
menu46 = Menu.create!(name: "バーベルプリーチャーカール", part: "腕（上腕二頭筋）", machine_id: m4.id)
menu47 = Menu.create!(name: "ダンベルプリーチャーカール", part: "腕（上腕二頭筋）", machine_id: m4.id)
menu48 = Menu.create!(name: "EZバーカール", part: "腕（上腕二頭筋）", machine_id: m4.id)
menu49 = Menu.create!(name: "ケーブルプリーチャーカール", part: "腕（上腕二頭筋）", machine_id: m4.id)
menu50 = Menu.create!(name: "ワンハンドプリーチャーカール", part: "腕（上腕二頭筋）", machine_id: m4.id)

# Menus related to Leg Press
menu51 = Menu.create!(name: "レッグプレス", part: "脚・尻（大腿四頭筋・ハムストリングス・内転筋・大臀筋）", machine_id: m5.id)

# Menus related to Upright Bike
menu52 = Menu.create!(name: "ワークアウト", part: "有酸素運動・脚・尻（大腿四頭筋・ハムストリングス・大臀筋）", machine_id: m6.id)

# Menus related to Flat Bench
menu53 = Menu.create!(name: "ダンベルプレス", part: "胸・肩・腕（大胸筋・三角筋・上腕三頭筋）", machine_id: m7.id)
menu54 = Menu.create!(name: "ダンベルフライ", part: "胸（大胸筋）", machine_id: m7.id)
menu55 = Menu.create!(name: "ダンベルショルダープレス", part: "肩・腕（三角筋・上腕三頭筋）", machine_id: m7.id)
menu56 = Menu.create!(name: "ダンベルワンハンドローイング", part: "背中（広背筋・僧帽筋）", machine_id: m7.id)
menu57 = Menu.create!(name: "チェストサポーテッドダンベルロウ", part: "背中（広背筋・僧帽筋）", machine_id: m7.id)
menu58 = Menu.create!(name: "リバースプッシュアップ", part: "腕・肩（上腕三頭筋・三角筋）", machine_id: m7.id)
menu59 = Menu.create!(name: "インクラインダンベルカール", part: "腕（上腕二頭筋）", machine_id: m7.id)
menu60 = Menu.create!(name: "ブルガリアンスクワット", part: "脚（大腿四頭筋・ハムストリングス）", machine_id: m7.id)
menu61 = Menu.create!(name: "レッグレイズ", part: "腹筋（腹直筋）", machine_id: m7.id)
menu62 = Menu.create!(name: "シットアップ", part: "腹筋（腹直筋）", machine_id: m7.id)

# Menus related to EZ Bar
menu63 = Menu.create!(name: "EZバーカール", part: "腕（上腕二頭筋）", machine_id: m8.id)
menu64 = Menu.create!(name: "ケーブルEZバーカール", part: "腕（上腕二頭筋）", machine_id: m8.id)
menu65 = Menu.create!(name: "EZバーリバースカール", part: "腕（上腕二頭筋・前腕）", machine_id: m8.id)
menu66 = Menu.create!(name: "EZバースパイダーカール", part: "腕（上腕二頭筋）", machine_id: m8.id)
menu67 = Menu.create!(name: "EZバードラッグカール", part: "腕（上腕二頭筋）", machine_id: m8.id)
menu68 = Menu.create!(name: "EZバートライセプスエクステンション", part: "腕（上腕三頭筋）", machine_id: m8.id)
menu69 = Menu.create!(name: "EZバーライイングトライセプスエクステンション", part: "腕（上腕三頭筋）", machine_id: m8.id)
menu70 = Menu.create!(name: "EZバーJMプレス", part: "腕（上腕三頭筋）", machine_id: m8.id)
menu71 = Menu.create!(name: "EZバーナローベンチプレス", part: "腕（上腕三頭筋）", machine_id: m8.id)
menu72 = Menu.create!(name: "EZバースピネイトプレスダウン", part: "腕（上腕三頭筋）", machine_id: m8.id)
menu73 = Menu.create!(name: "EZバーアップライトロウ", part: "肩（三角筋・僧帽筋）", machine_id: m8.id)
menu74 = Menu.create!(name: "EZバーフロントレイズ", part: "肩（三角筋）", machine_id: m8.id)
menu75 = Menu.create!(name: "EZバーリアデルトロウ", part: "肩（三角筋）", machine_id: m8.id)
menu76 = Menu.create!(name: "EZバーショルダープレス", part: "肩（三角筋）", machine_id: m8.id)
menu77 = Menu.create!(name: "EZバーグラビティープレス", part: "肩（三角筋）", machine_id: m8.id)
menu78 = Menu.create!(name: "EZバーベンチプレス", part: "胸（大胸筋）", machine_id: m8.id)
menu79 = Menu.create!(name: "EZバーデッドリフト", part: "背中・脚・尻（広背筋・ハムストリングス・大臀筋）", machine_id: m8.id)
menu80 = Menu.create!(name: "EZバーべントオーバーロウ", part: "背中（広背筋・僧帽筋）", machine_id: m8.id)
menu81 = Menu.create!(name: "EZバーリバースラットプルダウン", part: "肩（僧帽筋）", machine_id: m8.id)
menu82 = Menu.create!(name: "EZバーリバースシーテッドケーブルロウ", part: "背中（広背筋・僧帽筋）", machine_id: m8.id)
menu83 = Menu.create!(name: "EZバー・プルオーバー", part: "背中（広背筋）", machine_id: m8.id)
menu84 = Menu.create!(name: "EZバーシュラッグ", part: "肩（僧帽筋）", machine_id: m8.id)
menu85 = Menu.create!(name: "EZバーロールアウト", part: "腹筋（腹直筋）", machine_id: m8.id)
menu86 = Menu.create!(name: "EZバーフロントスクワット", part: "脚（大腿四頭筋）", machine_id: m8.id)
menu87 = Menu.create!(name: "EZバーランジ", part: "脚（大腿四頭筋・ハムストリングス）", machine_id: m8.id)
menu88 = Menu.create!(name: "EZバーヒップスラスト", part: "尻（大臀筋）", machine_id: m8.id)

# Menus related to Ab Coaster
menu89 = Menu.create!(name: "アブコースター", part: "腹筋（腹直筋）", machine_id: m9.id)

# Menus related to Sit Up Bench
menu90 = Menu.create!(name: "シットアップベンチツイスト", part: "腹筋（腹斜筋）", machine_id: m10.id)
menu91 = Menu.create!(name: "デクラインシットアップ", part: "腹筋（腹直筋）", machine_id: m10.id)
menu92 = Menu.create!(name: "レッグレイズ", part: "腹筋（腹直筋下部）", machine_id: m10.id)
menu93 = Menu.create!(name: "デクライン・ロシアンツイスト", part: "腹筋（腹斜筋）", machine_id: m10.id)
menu94 = Menu.create!(name: "ドラゴンフラッグ", part: "腹筋（腹斜筋）", machine_id: m10.id)

# Menus related to Adjustable Pulley
menu95 = Menu.create!(name: "ケーブルフライ", part: "胸（大胸筋）", machine_id: m11.id)
menu96 = Menu.create!(name: "ケーブルプルオーバー", part: "背中（広背筋）", machine_id: m11.id)
menu97 = Menu.create!(name: "ケーブルサイドレイズ", part: "肩（三角筋）", machine_id: m11.id)
menu98 = Menu.create!(name: "ケーブルリアフライ", part: "肩（三角筋）", machine_id: m11.id)
menu99 = Menu.create!(name: "フェイスプル", part: "肩（僧帽筋）", machine_id: m11.id)
menu100 = Menu.create!(name: "ケーブルアームカール", part: "腕（上腕二頭筋）", machine_id: m11.id)
menu101 = Menu.create!(name: "ケーブルトライセプスプレスダウン", part: "腕（上腕三頭筋）", machine_id: m11.id)
menu102 = Menu.create!(name: "ケーブルクランチ", part: "腹筋（腹直筋）", machine_id: m11.id)

# Menus related to Burbell
menu103 = Menu.create!(name: "フラットベンチプレス", part: "胸（大胸筋）", machine_id: m12.id)
menu104 = Menu.create!(name: "インクラインベンチプレス", part: "胸（大胸筋）", machine_id: m12.id)
menu105 = Menu.create!(name: "デクラインベンチプレス", part: "胸（大胸筋）", machine_id: m12.id)
menu106 = Menu.create!(name: "ワイドグリップベンチプレス", part: "胸（大胸筋）", machine_id: m12.id)
menu107 = Menu.create!(name: "ナロウグリップベンチプレス", part: "胸（大胸筋）", machine_id: m12.id)
menu108 = Menu.create!(name: "フロアバーベルベンチプレス", part: "胸（大胸筋）", machine_id: m12.id)
menu109 = Menu.create!(name: "ギロチンベンチプレス", part: "胸（大胸筋）", machine_id: m12.id)
menu110 = Menu.create!(name: "リバースグリップベンチプレス", part: "胸（大胸筋）", machine_id: m12.id)
menu111 = Menu.create!(name: "フロントショルダープレス", part: "肩（三角筋）", machine_id: m12.id)
menu112 = Menu.create!(name: "バックショルダープレス", part: "肩（三角筋）", machine_id: m12.id)
menu113 = Menu.create!(name: "アップライトロウイング", part: "肩（三角筋・僧帽筋）", machine_id: m12.id)
menu114 = Menu.create!(name: "バーベルキューバンプレス", part: "肩（三角筋）", machine_id: m12.id)
menu115 = Menu.create!(name: "バーベルアームカール", part: "腕（上腕二頭筋）", machine_id: m12.id)
menu116 = Menu.create!(name: "スカルクラッシャー", part: "腕（上腕三頭筋）", machine_id: m12.id)
menu117 = Menu.create!(name: "バーベルパンチリフト", part: "腕（上腕三頭筋）", machine_id: m12.id)
menu118 = Menu.create!(name: "床引きデッドリフト", part: "背中・脚・尻（広背筋・ハムストリングス・大臀筋）", machine_id: m12.id)
menu119 = Menu.create!(name: "ハーフデッドリフト", part: "背中・脚・尻（広背筋・ハムストリングス・大臀筋）", machine_id: m12.id)
menu120 = Menu.create!(name: "スモウデッドリフト", part: "背中・脚・尻（広背筋・ハムストリングス・大臀筋）", machine_id: m12.id)
menu121 = Menu.create!(name: "ワンレッグデッドリフト", part: "脚・尻（大腿四頭筋・ハムストリングス・大臀筋）", machine_id: m12.id)
menu122 = Menu.create!(name: "スナッチデッドリフト", part: "背中・脚・尻（広背筋・ハムストリングス・大臀筋）", machine_id: m12.id)
menu123 = Menu.create!(name: "ディフィシットデッドリフト", part: "背中・脚・尻（広背筋・ハムストリングス・大臀筋）", machine_id: m12.id)
menu124 = Menu.create!(name: "ベントオーバーロウ", part: "背中（広背筋・僧帽筋）", machine_id: m12.id)
menu125 = Menu.create!(name: "バーベルシュラッグ", part: "肩（僧帽筋）", machine_id: m12.id)
menu126 = Menu.create!(name: "フルスクワット", part: "脚・尻（大腿四頭筋・ハムストリングス・大臀筋）", machine_id: m12.id)
menu127 = Menu.create!(name: "フロントスクワット", part: "脚（大腿四頭筋）", machine_id: m12.id)
menu128 = Menu.create!(name: "ジャンピングスクワット", part: "脚（大腿四頭筋・ハムストリングス・大臀筋）", machine_id: m12.id)
menu129 = Menu.create!(name: "ブルガリアンスクワット", part: "脚（大腿四頭筋・ハムストリングス）", machine_id: m12.id)
menu130 = Menu.create!(name: "バーベルランジ", part: "脚（大腿四頭筋・ハムストリングス）", machine_id: m12.id)
menu131 = Menu.create!(name: "バーベルサイドランジ", part: "脚（大腿四頭筋・ハムストリングス）", machine_id: m12.id)
menu132 = Menu.create!(name: "ヒップスラスト", part: "尻（大臀筋）", machine_id: m12.id)
menu133 = Menu.create!(name: "バーベルカーフレイズ", part: "脚（腓腹筋・ヒラメ筋）", machine_id: m12.id)

# Menus related to Chest Press
menu134 = Menu.create!(name: "チェストプレス", part: "胸（大胸筋）", machine_id: m13.id)

# Menus related to Treadmill
menu135 = Menu.create!(name: "ワークアウト", part: "有酸素運動・脚・尻（大腿四頭筋・ハムストリングス・大臀筋）", machine_id: m14.id)

# Menus related to Pec Deck
menu136 = Menu.create!(name: "ペックデックフライ", part: "胸（大胸筋）", machine_id: m15.id)

MachineMenu.create!(machine: m1, menu: menu1)

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

MachineMenu.create!(machine: m1, menu: menu2)
MachineMenu.create!(machine: m1, menu: menu3)
MachineMenu.create!(machine: m1, menu: menu4)
MachineMenu.create!(machine: m1, menu: menu5)
MachineMenu.create!(machine: m1, menu: menu6)
MachineMenu.create!(machine: m1, menu: menu7)
MachineMenu.create!(machine: m1, menu: menu8)
MachineMenu.create!(machine: m1, menu: menu9)
MachineMenu.create!(machine: m1, menu: menu10)
MachineMenu.create!(machine: m1, menu: menu11)
MachineMenu.create!(machine: m1, menu: menu12)
MachineMenu.create!(machine: m1, menu: menu13)
MachineMenu.create!(machine: m1, menu: menu14)
MachineMenu.create!(machine: m1, menu: menu15)

MachineMenu.create!(machine: m2, menu: menu16)
MachineMenu.create!(machine: m2, menu: menu17)
MachineMenu.create!(machine: m2, menu: menu18)
MachineMenu.create!(machine: m2, menu: menu19)
MachineMenu.create!(machine: m2, menu: menu20)
MachineMenu.create!(machine: m2, menu: menu21)
MachineMenu.create!(machine: m2, menu: menu22)
MachineMenu.create!(machine: m2, menu: menu23)
MachineMenu.create!(machine: m2, menu: menu24)
MachineMenu.create!(machine: m2, menu: menu25)
MachineMenu.create!(machine: m2, menu: menu26)
MachineMenu.create!(machine: m2, menu: menu27)
MachineMenu.create!(machine: m2, menu: menu28)
MachineMenu.create!(machine: m2, menu: menu29)
MachineMenu.create!(machine: m2, menu: menu30)
MachineMenu.create!(machine: m2, menu: menu31)
MachineMenu.create!(machine: m2, menu: menu32)
MachineMenu.create!(machine: m2, menu: menu33)
MachineMenu.create!(machine: m2, menu: menu34)
MachineMenu.create!(machine: m2, menu: menu35)
MachineMenu.create!(machine: m2, menu: menu36)
MachineMenu.create!(machine: m2, menu: menu37)

MachineMenu.create!(machine: m3, menu: menu38)
MachineMenu.create!(machine: m3, menu: menu39)
MachineMenu.create!(machine: m3, menu: menu40)
MachineMenu.create!(machine: m3, menu: menu41)
MachineMenu.create!(machine: m3, menu: menu42)
MachineMenu.create!(machine: m3, menu: menu43)
MachineMenu.create!(machine: m3, menu: menu44)
MachineMenu.create!(machine: m3, menu: menu45)

MachineMenu.create!(machine: m4, menu: menu46)
MachineMenu.create!(machine: m4, menu: menu47)
MachineMenu.create!(machine: m4, menu: menu48)
MachineMenu.create!(machine: m4, menu: menu49)
MachineMenu.create!(machine: m4, menu: menu50)

MachineMenu.create!(machine: m5, menu: menu51)

MachineMenu.create!(machine: m6, menu: menu52)

MachineMenu.create!(machine: m7, menu: menu53)
MachineMenu.create!(machine: m7, menu: menu54)
MachineMenu.create!(machine: m7, menu: menu55)
MachineMenu.create!(machine: m7, menu: menu56)
MachineMenu.create!(machine: m7, menu: menu57)
MachineMenu.create!(machine: m7, menu: menu58)
MachineMenu.create!(machine: m7, menu: menu59)
MachineMenu.create!(machine: m7, menu: menu60)
MachineMenu.create!(machine: m7, menu: menu61)
MachineMenu.create!(machine: m7, menu: menu62)

MachineMenu.create!(machine: m8, menu: menu63)
MachineMenu.create!(machine: m8, menu: menu64)
MachineMenu.create!(machine: m8, menu: menu65)
MachineMenu.create!(machine: m8, menu: menu66)
MachineMenu.create!(machine: m8, menu: menu67)
MachineMenu.create!(machine: m8, menu: menu68)
MachineMenu.create!(machine: m8, menu: menu69)
MachineMenu.create!(machine: m8, menu: menu70)
MachineMenu.create!(machine: m8, menu: menu71)
MachineMenu.create!(machine: m8, menu: menu72)
MachineMenu.create!(machine: m8, menu: menu73)
MachineMenu.create!(machine: m8, menu: menu74)
MachineMenu.create!(machine: m8, menu: menu75)
MachineMenu.create!(machine: m8, menu: menu76)
MachineMenu.create!(machine: m8, menu: menu77)
MachineMenu.create!(machine: m8, menu: menu78)
MachineMenu.create!(machine: m8, menu: menu79)
MachineMenu.create!(machine: m8, menu: menu80)
MachineMenu.create!(machine: m8, menu: menu81)
MachineMenu.create!(machine: m8, menu: menu82)
MachineMenu.create!(machine: m8, menu: menu83)
MachineMenu.create!(machine: m8, menu: menu84)
MachineMenu.create!(machine: m8, menu: menu85)
MachineMenu.create!(machine: m8, menu: menu86)
MachineMenu.create!(machine: m8, menu: menu87)
MachineMenu.create!(machine: m8, menu: menu88)

MachineMenu.create!(machine: m9, menu: menu89)

MachineMenu.create!(machine: m10, menu: menu90)
MachineMenu.create!(machine: m10, menu: menu91)
MachineMenu.create!(machine: m10, menu: menu92)
MachineMenu.create!(machine: m10, menu: menu93)
MachineMenu.create!(machine: m10, menu: menu94)

MachineMenu.create!(machine: m11, menu: menu95)
MachineMenu.create!(machine: m11, menu: menu96)
MachineMenu.create!(machine: m11, menu: menu97)
MachineMenu.create!(machine: m11, menu: menu98)
MachineMenu.create!(machine: m11, menu: menu99)
MachineMenu.create!(machine: m11, menu: menu100)
MachineMenu.create!(machine: m11, menu: menu101)
MachineMenu.create!(machine: m11, menu: menu102)

MachineMenu.create!(machine: m12, menu: menu103)
MachineMenu.create!(machine: m12, menu: menu104)
MachineMenu.create!(machine: m12, menu: menu105)
MachineMenu.create!(machine: m12, menu: menu106)
MachineMenu.create!(machine: m12, menu: menu107)
MachineMenu.create!(machine: m12, menu: menu108)
MachineMenu.create!(machine: m12, menu: menu109)
MachineMenu.create!(machine: m12, menu: menu110)
MachineMenu.create!(machine: m12, menu: menu111)
MachineMenu.create!(machine: m12, menu: menu112)
MachineMenu.create!(machine: m12, menu: menu113)
MachineMenu.create!(machine: m12, menu: menu114)
MachineMenu.create!(machine: m12, menu: menu115)
MachineMenu.create!(machine: m12, menu: menu116)
MachineMenu.create!(machine: m12, menu: menu117)
MachineMenu.create!(machine: m12, menu: menu118)
MachineMenu.create!(machine: m12, menu: menu119)
MachineMenu.create!(machine: m12, menu: menu120)
MachineMenu.create!(machine: m12, menu: menu121)
MachineMenu.create!(machine: m12, menu: menu122)
MachineMenu.create!(machine: m12, menu: menu123)
MachineMenu.create!(machine: m12, menu: menu124)
MachineMenu.create!(machine: m12, menu: menu125)
MachineMenu.create!(machine: m12, menu: menu126)
MachineMenu.create!(machine: m12, menu: menu127)
MachineMenu.create!(machine: m12, menu: menu128)
MachineMenu.create!(machine: m12, menu: menu129)
MachineMenu.create!(machine: m12, menu: menu130)
MachineMenu.create!(machine: m12, menu: menu131)
MachineMenu.create!(machine: m12, menu: menu132)
MachineMenu.create!(machine: m12, menu: menu133)

MachineMenu.create!(machine: m13, menu: menu134)

MachineMenu.create!(machine: m14, menu: menu135)

MachineMenu.create!(machine: m15, menu: menu136)
