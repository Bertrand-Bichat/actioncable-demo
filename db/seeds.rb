Restaurant.destroy_all
User.destroy_all

user = User.create(email: 'test@gmail.com', password: 'password')

5.times do |i|
  Restaurant.create(user: user, name: "restaurant_#{i}", skip_callback: true)
end
