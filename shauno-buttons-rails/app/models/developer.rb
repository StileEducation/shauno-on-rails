class Developer < ApplicationRecord
    has_many :button_developer
    has_many :button, through: :button_developer

    has_many :event
end
