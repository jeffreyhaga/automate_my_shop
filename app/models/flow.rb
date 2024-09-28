class Flow < ApplicationRecord
  has_one_attached :file
  validates :file, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
