#Eric Richardson, 2016
entries = []
Dir.open(Dir.pwd).each do |file|
  next if File.directory? file or file == "concattonator.rb" or
          file == "Year.txt"
  entries << file
end

entries.sort! {|a,b| File.birthtime(a) <=> File.birthtime(b) }

master_file = File.new("Year.txt", "w")

master_file << entries.each do |file|
  entry = File.read(file)
  master_file << entry
  master_file << "\n\n ---End of File--- \n\n"
end
