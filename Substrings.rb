def substrings (str , dictionary)

  #create empty hash to hold values
  counts = Hash.new 0

  #split up setence and remove any charaters
  substring = str.downcase.gsub(/\W/, " ").split

  #loop through the sentence and find matching words
  dictionary.each do |word|
    substring.each do |match|
    counts[word] += 1 if match.include?(word)
end
end

puts counts
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
