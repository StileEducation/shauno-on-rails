class Button < ApplicationRecord
    has_many :button_reason
    has_many :reason, through: :button_reason

    has_many :button_developer
    has_many :developer, through: :button_developer

    has_many :event

    validates :uuid, presence: true

    def current_reason
        self.reason.where(button_reasons: { current: true }).first
    end

    def current_developer
        self.developer.where(button_developers: { current: true }).first
    end
end
