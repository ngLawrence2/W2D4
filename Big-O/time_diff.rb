require 'byebug'

def my_min(arr)
  min = arr.first
  i = 0
  while i < arr.length - 1
    num1 = arr[i]
    j = i + 1
    while j < arr.length
      num2 = arr[j]
      min = num2 if min > num2
      j += 1
    end
    i += 1
  end
  min
end


def my_minV2(arr)
  min = nil
  arr.each do |num|
    min = num if min==nil || num < min
  end
  min
end


def largest_contiguous_subsum(arr)
  subArr = subsets(arr)
  max = nil
  subArr.each do |sum|
    sum_sub_arr = 0
    sum.each do |val|
        sum_sub_arr+=val
    end
    max = sum_sub_arr if max==nil || sum_sub_arr>max
  end
  max
end


def subsets(arr)
  subs=[]
  i=0
  while i < arr.length
    j=i+1
    while j <= arr.length
      subs << arr[i...j]
      j=j+1
    end
    i=i+1
  end
  subs
end

def largest_contiguous_subsum_v2(arr)
  # debugger
  max = nil
  i = 0
  temp = 0
  while i < arr.length
    if temp + arr[i] < 0
      temp = 0
    else
    temp += arr[i]
    end
    max = temp if max.nil? || max < temp
    i += 1
  end
  max
end

p largest_contiguous_subsum_v2([2, 3, -6, 7, -6, 7])

def first_anagram?(str1, str2)
  anagrams = make_anagram(str1)
  anagrams.each do |anagram|
    return true if anagram.sort == str2.chars.sort
  end
  false
end

def make_anagram(str)
  arr = str.chars.permutation.to_a
end

def second_anagram?(str1,str2)
  return false if str1.length!=str2.length
  char1 = str1.chars
  char2 = str2.chars
  i = 0
  while i < char1.length
    char2.delete(char1[i])
    char1.delete(char1[i])
  end
  return true if char1.empty? && char2.empty?
  false
end

def third_anagram?(str,str2)
  return true if str.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  h1 = Hash.new(0)
  h2 = Hash.new(0)

  str1.chars.each do |char|
    h1[char] += 1
  end

  str2.chars.each do |char|
    h2[char] += 1
  end

  return true if h1 == h2
  false
end


def two_sum?(arr, target)
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target
      j += 1
    end
    i += 1
  end
  false
end

def two_sum_v2?(arr, target)
  arr.sort!
  i = 0
  x = arr.length - 1
  until i != x
    val1 = arr[i]
    val2 = arr[x]
    case (val1 + val2) <=> target
    when 0
      return true
    when -1
      i += 1
    when 1
      x -= 1
    end
  end
  false
end

def two_sum_v3(arr, target)
  hash = {}
  arr.each do |num|
    if hash.has_key?(target-num)
      return true
    else
      hash[num] = 0
    end
  end
  false
end

def windowed_max_range(arr, window_size)
  current_max_range = nil
  i = 0
  while i < arr.length - window_size
    temp_arr = arr.slice(i+1, window_size)
    min = temp_arr.min
    max = temp_arr.max
    current_max_range = max - min if current_max_range.nil? || max - min > current_max_range
    i += 1
  end
  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
