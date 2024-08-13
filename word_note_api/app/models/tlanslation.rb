class Tlanslation < ApplicationRecord
  belongs_to :word
  has_many :example
end
