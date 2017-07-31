def substrings(string, dictionary)
    string = string.downcase
    substring_list = {}
    dictionary.each do |word|
        if string.scan(word).any?
            substring_list[word] = string.scan(word).length
        end
    end
    substring_list 
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("below", dictionary)
# => {"below"=>1, "low"=>1}

p substrings("Howdy partner, sit down! How's it going?", dictionary)
# => {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}
