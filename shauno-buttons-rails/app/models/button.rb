class Button < ApplicationRecord
    has_many :button_reason
    has_many :reason, through: :button_reason
end
