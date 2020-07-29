# PHASE 2
def convert_to_int(str)
  begin

    Integer(str)
  rescue ArgumentError
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class CoffeeError < StandardError
end
def reaction(maybe_fruit)
  # begin
  #   FRUITS.include?(maybe_fruit)
  # rescue
  #   if maybe_fruit == "coffee"
  #     retry
  #   else
  #     raise("I'm mad now")
  #   end
  # end
  # puts "Thank you!"
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError
      puts "Thanks for the coffee, now give me a fruit!"
      retry 
  rescue StandardError
    puts "I'm angry"  
  end

end  

# PHASE 4
class FriendError < StandardError
  def initialize(msg="Not enough years", exception_type="custom")
    super(msg)
  end
end

class InputError < ArgumentError
  def initialize(msg="You REALLY need to tell me more about yourself", exception_type="custom")
    super(msg)
  end
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if yrs_known < 5
      raise FriendError
    end
    [name, fav_pastime].any? {|ele| raise InputError if ele.length <= 0} 
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


