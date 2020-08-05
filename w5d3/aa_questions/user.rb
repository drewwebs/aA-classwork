class User
    attr_accessor :fname, :lname, :id

    def self.find_by_id(id)
        data=QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT 
            *
        FROM
            users
        WHERE
            id = ?
        SQL
        User.new(*data)
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end

    def self.find_by_name(fname, lname)
        data=QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT 
            *
        FROM
            users
        WHERE
            fname = ? AND lname = ?
        SQL
        User.new(*data)
    end

    def initialize(options)
        @fname = options['fname']
        @lname = options['lname']
        @id = options['id']
    end

    def create
        raise "User already exists" if self.id
        QuestionsDatabase.instance.execute(<<-SQL,self.fname,self.lname)
        INSERT INTO users(
            fname,lname
        ) VALUES
        (?,?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "User doesn't exist" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
        UPDATE
            users
        SET
            fname = ?, lname = ?
        WHERE
            id = ?
        SQL
    end 

    def authored_questions
        Question.find_by_user_id(self.id)
    end

    def authored_replies
        Reply.find_by_user_id(self.id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(self.id)
    end

    def liked_questions 
        QuestionLike.liked_questions_for_user_id(self.id)
    end

    def average_karma
        #get liked questions, get likes for each question, divide by num questions
        data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
        SELECT
            COUNT(question_likes.id)/(COUNT(DISTINCT(questions.id))) AS karma
        FROM
            users
        LEFT OUTER JOIN
            questions ON users.id = questions.user_id
        LEFT OUTER JOIN
            question_likes ON questions.id = question_likes.question_id
        WHERE
            users.id = 1
        GROUP BY 
            questions.id
        SQL

    end

end

#/(COUNT(DISTINCT(questions.id))) AS karma
 #--question_likes.question_id might be null

 questions.title, COUNT(question_likes.id)