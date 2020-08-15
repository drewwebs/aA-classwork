class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    
    COLORS = ['White', 'Black', 'Orange', 'Speckled', 'Brown']

    validates :color, inclusion: { in: COLORS}
    validates :sex, inclusion: { in: ['M', 'F'] }

    def age
        time_ago_in_words(birth_date)   
    end


end

