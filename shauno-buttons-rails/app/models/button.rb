class Button < ApplicationRecord
    has_many :button_reason
    has_many :reason, through: :button_reason

    has_many :button_developer
    has_many :developer, through: :button_developer

    validates :uuid, presence: true
end
