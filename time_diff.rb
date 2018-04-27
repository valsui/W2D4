def my_min(list)
  list.each_with_index do |x,i|
    min_found = true
    min = x
    list.each_with_index do |y,j|
      next if i == j
      min_found = false if x > y
    end
    return min if min_found == true
  end
end

def my_min2(list)
  min = list.first
  list.each do |x|
    min = x  if x < min
  end
  min

end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

puts "my_min found: #{my_min(list)} will have O(n**2)"
puts "my_min2 found: #{my_min2(list)} will have O(n)"

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]

def larg_sum(list)
  result = []
  (0...list.length).each do |start|
    subs = [list[start]]
    result << subs
    (start+1...list.length).each do |stop|
      subs += [list[stop]]
      result << subs
    end
  end
  sums = result.map {|el| el.reduce(:+)}
  sums.max
end

def larg_sum2(list)
  final_sum = list.first

  (1...list.length).each do |i|
     current_sum = list[i]
     final_sum += list[i] if i != list.length-1 || list[i] > 0
     if current_sum > final_sum
       final_sum = current_sum
     end
  end
  final_sum
end

puts "large_sum found #{larg_sum(list1)} as the largest sum from list1"
puts "large_sum found #{larg_sum(list2)} as the largest sum from list2"
puts "large_sum found #{larg_sum(list3)} as the largest sum from list3"

puts "large_sum2 found #{larg_sum2(list1)} as the largest sum from list1"
puts "large_sum2 found #{larg_sum2(list2)} as the largest sum from list2"
puts "large_sum2 found #{larg_sum2(list3)} as the largest sum from list3"

puts "large_sum2 found #{larg_sum2(list)} as the largest for list"
