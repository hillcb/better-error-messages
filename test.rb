u = User.new
u.valid?
puts u.errors.full_messages
