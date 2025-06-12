class Menu < ApplicationRecord
  has_many :machine_menus
  has_many :machines, through: :machine_menus
end
