class SwapcardAutonomy < ApplicationRecord
  validates :sc_id, presence: true, uniqueness: true
end
