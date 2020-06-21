class Book < ApplicationRecord

    belongs_to :user, optional: true

    validates :title, presence: true
    validates :opinion, presence: true
end
