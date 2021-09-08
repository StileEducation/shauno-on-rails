class Reason < ApplicationRecord
    has_many :button_reason
    has_many :button, through: :button_reason

    has_many :event

    validates :reason, presence: true
end
