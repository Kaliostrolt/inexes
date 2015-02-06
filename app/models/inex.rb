class Inex < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :cost
  belongs_to :category
  belongs_to :user
end
