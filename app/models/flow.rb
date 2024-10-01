class Flow < ApplicationRecord

  has_one_attached :file

  #Associations
  belongs_to :user

  #Valdidations
  validates :file, presence: true, content_type:{ in: ['text/flow'], message: "Must be .flow file type" }
  validates :title, presence: true
  validates :description, presence: true

end
