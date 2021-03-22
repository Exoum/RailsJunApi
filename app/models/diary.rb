class Diary < ApplicationRecord
  has_many :notes
  enum kind: {private_type: 0, public_type: 1}
end
