# Capture text between square brackets 
extract_text_between_square_brackets = /(?<=\[)(.*?)(?=\])/
extract_link = /\((.*?)\)/

puts '```'
File.foreach("docs/contents.md") { |line| 
  matches = line.match(extract_text_between_square_brackets)
  matches.captures.each() { |capture|
    words = capture.split(' ')
    link = line.match(extract_link)
    kwic_entry = []
    words.each_with_index() { |word,ix|
        kwic_entry << words[0..ix-1].join(' ').rjust(60,'.') unless ix == 0
        kwic_entry << "[#{word}]#{link}"
        kwic_entry += words[ix+1..words.length-1] unless ix == words.length
        puts "#{kwic_entry.join(' ')}  \n"
        kwic_entry.clear
    }
  } unless matches == nil
  puts '```'
}