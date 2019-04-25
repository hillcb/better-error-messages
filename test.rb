    u = User.find_or_create_by(name: "m", email: "test@gmail.com")
    u1 = User.create(name: "m", email: "test2@gmail.com")
    msgs = u1.errors.full_messages
    msg0 = "Name has already been taken, Name is case sensitive"
    puts msgs
    
    b = Blog.new
    b.user = u1 
    b.valid?
    puts b.errors.full_messages
