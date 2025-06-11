class Machine < ApplicationRecord
  has_many :machine_menus
  has_many :menus, through: :machine_menus
end