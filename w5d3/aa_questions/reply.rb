class Reply
    attr_accessor :question_id, :parent_reply_id, :body, :user_id, :id

    def self.find_by_id(id)
        data=QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM
            replies
        WHERE
            id = ?
        SQL
        Reply.new(*data)
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_user_id(user_id)
        data=QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT 
            *
        FROM
            replies
        WHERE
            user_id = ?
        SQL
        data.map { |datum| Reply.new(datum) }        
    end

    def self.find_by_question_id(question_id)
        data=QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT 
            *
        FROM
            replies
        WHERE
            question_id = ?
        SQL
        data.map { |datum| Reply.new(datum) }        
    end

    def initialize(options)
        @user_id = options['user_id']
        @question_id = options['question_id']
        @body = options['body']
        @parent_reply_id = options['parent_reply_id']
        @id = options['id']
    end

    def create
        raise "Reply already exists" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.user_id, self.question_id, self.body, self.parent_reply_id)
        INSERT INTO replies(
            user_id, question_id, body, parent_reply_id
        ) VALUES
        (?, ?, ?, ?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "Reply doesn't exist" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.user_id, self.question_id, self.body, self.parent_reply_id, self.id)
        UPDATE
            replies
        SET
            user_id = ?, question_id = ?, body = ?, parent_reply_id = ?
        WHERE
            id = ?
        SQL
    end

    def author
        User.find_by_id(self.user_id)
    end

    def question 
        Question.find_by_id(self.question_id)
    end

    def parent_reply
        Reply.find_by_id(self.parent_reply_id)
    end

    def child_replies 
        data=QuestionsDatabase.instance.execute(<<-SQL, self.id)
        SELECT 
            *
        FROM
            replies
        WHERE
            parent_reply_id = ?
        SQL
        data.map { |datum| Reply.new(datum) }       
    end
end