def anagram1(word,check)
  word_array = word.split("").permutation.to_a
  word_array.map(&:join).include?(check) #O(n*(n!))
end

def anagram2(word,check)
  return false if word.length != check.length
  word_dup = word.downcase!
  check_dup = check.downcase!
  word.chars do |char|
    check.chars do |char2|
      if char == char2
        word_dup.delete!(char)
        check_dup.delete!(char)
      end
    end
  end
  word_dup.empty? && check_dup.empty?
end #O(n^2)

def anagram3(word,check)
  word.downcase.chars.sort == check.downcase.chars.sort
end #O(n^2)

def anagram4(word,check)
  word_hash = Hash.new(0)
  check_hash = Hash.new(0)
  word.chars do |char|
    word_hash[char] +=1
  end

  check.chars do |char|
    check_hash[char] +=1
  end

  word_hash == check_hash

end

# puts "#{anagram1("gizmo","sally")}"
# puts "#{anagram1("elvis", "lives")}"

# puts "#{anagram2("gizmo","sally")}"
# puts "#{anagram2("elvis", "lives")}"

# puts "#{anagram3("gizmo","sally")}"
# puts "#{anagram3("elvis", "lives")}"

puts "#{anagram4("gizmo","sally")}"
puts "#{anagram4("elvis", "lives")}"

##
