# Defines each journal entry
class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :place
end
