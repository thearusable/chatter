#how many
UsersCount = 50
MessagesInRoomsCount = 500


#separate seed files
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
