namespace :dev do
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name:  FFaker::Name.first_name,
	opening_hours: FFaker::Time.datetime,
	tel: FFaker::PhoneNumber.short_phone_number,
	address: FFaker::Address.street_address,
	description: FFaker::Lorem.paragraph,
        category: Category.all.sample

	)
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data  "
  end

  task fake_user: :environment do
    20.times do  |i|
       user_name = FFaker::Name.first_name + "." + FFaker::Name.last_name
       User.create!( email: "#{user_name}@example.com", password:"123456" )
    end
    puts "users created"
    puts "#{User.count} users"
  end
  
  task  fake_comment:  :environment do 
    Restaurant.all.each do |restaurant|
	3.times do |i|
	  restaurant.comments.create!(content: FFaker::Lorem.sentence, user: User.all.sample )
	end
    end
    puts "fake comments created"
    puts "#{Comment.count} comments "
  end




end
