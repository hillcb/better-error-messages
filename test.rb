u = User.new
u.email = "eamo@df.com"
u.valid?
puts u.errors.full_messages

u = User.new
u.name = "admin"
u.email = "abc@example.com"
u.valid?
puts u.errors.full_messages
