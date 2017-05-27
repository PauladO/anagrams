
words = File.read('wordlist.txt')
words = words.downcase
words = words.split("\n")

starting_time = Time.now
sorted_words = Hash.new

words.each do |word|
  sorted_words[word.chars.sort.join] ||= []
  sorted_words[word.chars.sort.join].push(word)
end

anagrams = sorted_words.select { |key, value|   value.length > 1 }

##################################################################

puts "It took #{(Time.now - starting_time).round(2)} seconds to compile a list of #{anagrams.count} sets of anagrams."

continue = "y"

while continue == "y" || continue == "yes" do
  print "which word are you looking for? "
  anagram_word = gets.chomp

  answer = anagrams["#{anagram_word.chars.sort.join}"].select {|word| word != anagram_word}
  answer ||= []
  puts answer.length == 0 ? "No anagrams found" : answer.join(", ")
  puts "Need more anagrams? y/n"
  continue = gets.chomp.downcase
end
