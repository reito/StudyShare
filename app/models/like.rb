class Like < ApplicationRecord
    validates :like_id, presence: true
    validates :liked_id, presence: true
    validates :answer_id, presence: true
end
