# Capture text between square brackets 
extract_text_between_square_brackets = /(?<=\[)(.*?)(?=\])/
extract_link_text = /\((.*?)\)/
left_column = []
right_column =  []
page_heading = '# Help KWIC Index'
link_to_contents_document = "[Contents](contents.md)"
table_start = '<table><thead><tr><th colspan="2">Keyword In Context Index</th></thead><tbody><tr><td>'
table_cell = '</td><td>'
table_row = '</td></tr><tr><td align="right">'
table_end = '</tr></tbody></table>'
sort_table = []
words_to_exclude = [
  "a", "and", "in", "is", "of", "on", "or", "for", "the", "with" 
]

puts link_to_contents_document
puts page_heading
puts table_start
File.foreach("docs/contents.md") { |line| 
  matches = line.match(extract_text_between_square_brackets)
  matches.captures.each() { |capture| 
    words = capture.split(' ')
    link_text = line.match(extract_link_text)[1]
    kwic_entry_left = []
    kwic_entry_right = []
    words.each_with_index() { |word,ix|
      unless words_to_exclude.include? word.downcase 
        kwic_entry_left << words[0..ix-1].join(' ') unless ix == 0
        kwic_entry_right << "<a href=\"#{link_text}\">#{word}</a> "
        kwic_entry_right << words[ix+1..words.length-1] unless ix == words.length
        left_column << "#{kwic_entry_left.join(' ')}"
        right_column << "#{kwic_entry_right.join(' ')}"

        sort_table << [ word.downcase, "#{kwic_entry_left.join(' ')}", "#{kwic_entry_right.join(' ')}" ] 

        kwic_entry_left = []
        kwic_entry_right = []
      end 
    } 
  } unless matches == nil
}


sort_table.sort.each() { |sorted_entry|
  puts "#{table_row}#{sorted_entry[1]}#{table_cell}#{sorted_entry[2]}"
}

#left_column.each_with_index() { |left_entry, ix|
#  puts "#{table_row}#{left_entry}#{table_cell}#{right_column[ix]}"
#}

puts table_end 
