class Publication < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
end
