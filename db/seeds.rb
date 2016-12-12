#how many
UsersCount = 40
MessagesInRoomsCount = 500

def image_male
  File.open(Dir.glob(File.join(Rails.root, '/app/assets/images/seed/male', '*')).sample)
end

def image_female
  File.open(Dir.glob(File.join(Rails.root, '/app/assets/images/seed/female', '*')).sample)
end

#separate seed files
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
