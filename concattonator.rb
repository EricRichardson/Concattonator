#Eric Richardson, 2016
entries = []
Dir.open(Dir.pwd).each do |file|
  next if File.directory? file or file == "concattonator.rb" or
          file == "Year.txt"
  entries << file
end

month_order = {January: 1, February: 2, March: 3, April: 4, May: 5, June: 6,
          July: 7, August: 8, September: 9, October: 10, November: 11,
          December: 12}
entries.sort! {|a,b| File.birthtime(a) <=> File.birthtime(b) }


master_file = File.new("Year.txt", "w")

master_file << entries.each do |file|
  entry = File.read(file)
  master_file << entry
  master_file << "\n\n ---End of File--- \n\n"
end
