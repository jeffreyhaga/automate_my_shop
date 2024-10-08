class Flow < ApplicationRecord

  has_one_attached :file

  #Associations
  belongs_to :user

   #Valdidations
  #validates :file, presence: true, content_type:{ in: ['text/flow'], message: "Must be .flow file type" }
  validates :title, presence: true, on: :create
  validates :description, presence: true, on: :create
  validates :file,
    presence: true,
    content_type: { in: ['application/octet-stream'], message: 'must be a .flow file' }

end
