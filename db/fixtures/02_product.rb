10.times do
	Product.seed do |s|
		s.name = "#{Faker::Food.fruits}"
		s.price = rand(100)
	end
end