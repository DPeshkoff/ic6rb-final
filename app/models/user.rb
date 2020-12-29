class User < ApplicationRecord
    validates :username, presence: true, length: { maximum: 50 }, uniqueness: true
    validates :password, presence: true, length: { maximum: 50 }
    validates :group, presence: true
end
