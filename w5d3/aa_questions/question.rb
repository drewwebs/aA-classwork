class Question
    attr_accessor :title, :body, :user_id, :id

    def self.find_by_id(id)
        data=QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        Question.new(*data)
    end

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end

    def self.most_liked(n)
        QuestionLike.most_liked_questions(n)
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_user_id(user_id)
        data=QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT 
            *
        FROM
            questions
        WHERE
            user_id = ?
        SQL
        data.map { |datum| Question.new(datum) }      
    end

    def initialize(options)
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
        @id = options['id']
    end

    def create
        raise "Question already exists" if self.id
        QuestionsDatabase.instance.execute(<<-SQL,self.title,self.body, self.user_id)
        INSERT INTO questions(
            title, body, user_id
        ) VALUES
        (?,?,?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "Question doesn't exist" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.user_id, self.id)
        UPDATE
            questions
        SET
            title = ?, body = ?, user_id = ?
        WHERE
            id = ?
        SQL
    end

    def author
        User.find_by_id(self.user_id)
    end

    def replies
        Reply.find_by_question_id(self.id)
    end

    def likers
        QuestionLike.likers_for_question_id(self.id)
    end

    def num_likes
        QuestionLike.num_likes_for_question_id(self.id)
    end

end