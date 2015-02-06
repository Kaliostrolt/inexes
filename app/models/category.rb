class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :kind

  belongs_to :user
  has_many :inexes, dependent: :destroy
end
