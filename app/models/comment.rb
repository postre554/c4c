class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :publication

  validates :texto, presence: true
  validates :fecha_publicacion, presence: true
  validates :user_id, inclusion: { in: [nil, 2] }
end
