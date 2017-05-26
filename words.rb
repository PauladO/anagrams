
words = File.read('wordlist.txt')
words = words.downcase
words = words.split("\n")





def is_anagram?(a, b)
  return true
end

puts is_anagram?('test', 'stet')

puts is_anagram?('test', 'mest')
