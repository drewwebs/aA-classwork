class QuestionFollow
    attr_accessor :question_id, :user_id, :id

    def self.most_followed_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL, n)
        SELECT
            questions.title, questions.body, questions.user_id, questions.id, COUNT(*) AS num_follows
        FROM
            question_follows
        JOIN
            questions ON question_follows.question_id = questions.id
        GROUP BY
            question_follows.question_id
        ORDER BY
            num_follows DESC
        LIMIT
            ?
        SQL
        data.map {|datum| Question.new(datum)}
    end

    def self.find_by_id(id)
        data=QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM
            question_follows
        WHERE
            id = ?
        SQL
        QuestionFollow.new(*data)
    end

    def self.followers_for_question_id(question_id)
        data=QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            users.id, fname, lname
        FROM
            question_follows
        JOIN users
            ON users.id = question_follows.user_id
        WHERE
            question_id = ?
        SQL
        data.map {|datum| User.new(datum)}
    end

    def self.followed_questions_for_user_id(user_id)
        data=QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            questions.title, questions.body, questions.user_id, questions.id
        FROM
            question_follows
        JOIN questions
            ON questions.user_id = question_follows.user_id
        WHERE
            questions.user_id = ?
        SQL
        data.map {|datum| Question.new(datum)}    
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map { |datum| QuestionFollow.new(datum) }
    end

    def initialize(options)
        @user_id = options['user_id']
        @question_id = options['question_id']
        @id = options['id']
    end

    def create
        raise "Question Follow already exists" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.user_id, self.question_id)
        INSERT INTO question_follows(
            user_id,question_id
        ) VALUES
        (?, ?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "Question follow doesn't exist" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.user_id, self.question_id, self.id)
        UPDATE
            question_follows
        SET
            user_id = ?, question_id = ?
        WHERE
            id = ?
        SQL
    end

end