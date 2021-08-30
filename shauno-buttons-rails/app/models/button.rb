class Button < ApplicationRecord
    has_many :button_reason
    has_many :reason, through: :button_reason

    has_many :button_developer
    has_many :developer, through: :button_developer

    validates :uuid, presence: true

    # def reasons 
    #     reasons = Reason.all
    #     reasons_list = []
    #     reasons_list.each do |reason|
    #         reasons_list.push(reason.reason)
    #     end

    #     reasons_list
    # end
end
