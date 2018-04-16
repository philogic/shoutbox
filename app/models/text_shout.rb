class TextShout < ApplicationRecord
  validates :body, length: { in: 1..150 }
end
