class Shout < ApplicationRecord
  belongs_to :user
  validates_presence_of :body, :user
  validates :body, length: { in: 1..150 }
  default_scope { order(created_at: :desc) }
  delegate :username, to: :user
end
