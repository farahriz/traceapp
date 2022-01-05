class Checkin < ApplicationRecord
    belongs_to :location
    include ActionView::Helpers::DateHelper

    def date_from
        from_time = Time.now
        return distance_of_time_in_words(from_time, self.created_at)    
    end
end
