class QuestionLike
    attr_accessor :question_id, :user_id, :id

    def self.find_by_id(id)
        data=QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT 
            *
        FROM
            question_likes
        WHERE
            id = ?
        SQL
        QuestionLike.new(*data)
    end

    def self.likers_for_question_id(question_id)
        data=QuestionsDatabase.instance.execute(<<-SQL,question_id)
        SELECT
            users.fname, users.lname, users.id
        FROM
            question_likes
        JOIN
            users ON users.id = question_likes.user_id
        WHERE
            question_likes.question_id = ?
        SQL
        data.map {|datum| User.new(datum)}
    end

    def self.num_likes_for_question_id(question_id)
        data=QuestionsDatabase.instance.execute(<<-SQL,question_id)
        SELECT
            COUNT(*)
        FROM
            question_likes
        WHERE
            question_id = ?
        SQL
        data[0].values.first
    end

    def self.liked_questions_for_user_id(user_id)
        data=QuestionsDatabase.instance.execute(<<-SQL,user_id)
        SELECT
            questions.title, questions.body, questions.user_id, questions.id
        FROM
            question_likes
        JOIN
            questions ON questions.id = question_likes.question_id
        WHERE
            question_likes.user_id = ?
        SQL
        data.map {|datum| Question.new(datum)}
    end

    def self.most_liked_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL, n)
        SELECT
            questions.title, questions.body, questions.user_id, questions.id, COUNT(*) AS num_likes
        FROM
            question_likes
        JOIN
            questions ON question_likes.question_id = questions.id
        GROUP BY
            question_likes.question_id
        ORDER BY
            num_likes DESC
        LIMIT
            ?
        SQL
        data.map {|datum| Question.new(datum)}
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map { |datum| QuestionLike.new(datum) }
    end

    def initialize(options)
        @user_id = options['user_id']
        @question_id = options['question_id']
        @id = options['id']
    end

    def create
        raise "Question Like already exists" if self.id
        QuestionsDatabase.instance.execute(<<-SQL,self.user_id,self.question_id)
        INSERT INTO question_likes(
            user_id,question_id
        ) VALUES
        (?,?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "Question like doesn't exist" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.user_id,self.question_id,self.id)
        UPDATE
            question_likes
        SET
            user_id = ?, question_id = ?
        WHERE
            id = ?
        SQL
    end
end