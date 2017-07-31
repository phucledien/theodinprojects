def caesar_cipher(string, shifter)
  new_string = ""
  string.each_char do |char|
    if char.between?("A", "Z")
      char = (char.ord + shifter).chr
      if char > "Z"
        char = ("A".ord + char.ord - "Z".ord - 1).chr
      elsif char < "A"
        char = ("Z".ord - "A".ord + char.ord + 1).chr
      end
    elsif char.between?("a", "z")
      char = (char.ord + shifter).chr
      if char > "z"
        char = ("a".ord + char.ord - "z".ord - 1).chr
      elsif char < "a"
        char = ("z".ord - "a".ord + char.ord + 1).chr
      end
    end
    new_string += char
  end
  new_string
end

puts caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"
