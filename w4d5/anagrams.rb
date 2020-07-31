require "byebug"
def first_anagram?(word1,word2)
    perms = word1.split("").permutation.to_a
    perms.each {|word| return true if word.join("") == word2 }
    false
end
# n! 
# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("hydroxydeoxycorticosterones", "hydroxydesoxycorticosterone") 
# p first_anagram?("undefinability","unidentifiably")

def second_anagram?(word1,word2)
    arr = word2.split("")
    word1.each_char do |ele|
        # debugger
        # i = arr.index(ele)
        arr.delete(ele)
    end
    arr.empty? ? true : false
end
# n**2 + m
# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")      #=> true
# p second_anagram?("undefinability","unidentifiably")
# p second_anagram?("hydroxydeoxycorticosterones", "hydroxydesoxycorticosterone") 

def third_anagram?(word1,word2)
    word1.split("").sort == word2.split("").sort
end
# n + m
# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")      #=> true
# p third_anagram?("hydroxydeoxycorticosterones", "hydroxydesoxycorticosterone") 
# p third_anagram?("undefinability","unidentifiably")

def fourth_anagram?(word1,word2)
    hash = Hash.new(0)
    word1.each_char {|char| hash[char] += 1}
    word2.each_char {|char| hash[char] -= 1}
    hash.values.all? {|v| v == 0}
end
#  n + m
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")      #=> true
p fourth_anagram?("hydroxydeoxycorticosterones", "hydroxydesoxycorticosterone") #=> true
p fourth_anagram?("undefinability","unidentifiably") #=> true