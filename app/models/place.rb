# Defines association between places and entries
class Place < ApplicationRecord
  has_many :entries
end
