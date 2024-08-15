class Word < ApplicationRecord
  has_many :translations
  has_many :examples
  accepts_nested_attributes_for :translations, allow_destroy: true
end
