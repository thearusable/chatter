#how many
UsersCount = 5
PublicRoomsCount = 50
PrivateRoomsCount = 50
MessagesInRoomsCount = 500

s3 = Aws::S3::Client.new
AllMaleSamples = s3.list_objects(bucket: ENV['S3_BUCKET_NAME'], prefix: 'seed/male/').contents
AllFemaleSamples = s3.list_objects(bucket: ENV['S3_BUCKET_NAME'], prefix: 'seed/female/').contents

 def image_male
   "https://s3-#{ENV['AWS_REGION']}.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/#{AllMaleSamples.sample.key}"
 end

 def image_female
   "https://s3-#{ENV['AWS_REGION']}.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/#{AllFemaleSamples.sample.key}"
 end

#separate seed files
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
