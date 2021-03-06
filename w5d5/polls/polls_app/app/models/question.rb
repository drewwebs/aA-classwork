class Question < ApplicationRecord
    has_many :answer_choices,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :AnswerChoices
     
    belongs_to :poll,
        primary_key: :id,
        foreign_key: :poll_id,
        class_name: :Poll
end