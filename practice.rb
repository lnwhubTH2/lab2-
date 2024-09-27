# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
    end
  end
  

  user1 = User.new("jay", "jay@ebu.com", "password123")
  
  
  puts user1.name     
  puts user1.email    
  puts user1.password 
  
    

# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
    end
  
    def add_user(user)
      @users << user
    end
  
    def remove_user(user)
      @users.delete(user)
    end
  
    def to_s
      "Room(name: #{@name}, description: #{@description}, users: #{@users})"
    end
  end
  
  
  room1 = Room.new("Conference Room", "ห้องสำหรับประชุม")
  room1.add_user("joy")
  room1.add_user("่jay")
  
  puts room1  
  
 
  puts room1.name          
  puts room1.description   
  puts room1.users.inspect 
  
# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  
    def to_s
      "Message(user: #{@user}, room: #{@room}, content: '#{@content}')"
    end
  end
  
  
  message1 = Message.new("jay", "Conference Room", "สวัสดีค่ะ!")
  puts message1  
  
# add a method to user so, user can enter to a room
# user.enter_room(room)
class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
    end
  
    def add_user(user)
      @users << user
    end
  
    def remove_user(user)
      @users.delete(user)
    end
  
    def to_s
      "Room(name: #{@name}, description: #{@description}, users: #{@users})"
    end
  end
  
  class User
    attr_accessor :name
  
    def initialize(name)
      @name = name
    end
  
    def enter_room(room)
      room.add_user(self)
      puts "#{@name} ได้เข้าห้อง #{room.name}"
    end
  
    def to_s
      "User(name: #{@name})"
    end
  end
  
  
  room1 = Room.new("Conference Room", "ห้องสำหรับประชุม")
  user1 = User.new("jay")
  
  user1.enter_room(room1)
  puts room1 
  
# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)
class Room
    attr_accessor :name, :description, :users, :messages
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
      @messages = []
    end
  
    def add_user(user)
      @users << user
    end
  
    def remove_user(user)
      @users.delete(user)
    end
  
    def add_message(message)
      @messages << message
    end
  
    def to_s
      "Room(name: #{@name}, description: #{@description}, users: #{@users}, messages: #{@messages.map(&:content)})"
    end
  end
  
  class User
    attr_accessor :name
  
    def initialize(name)
      @name = name
    end
  
    def enter_room(room)
      room.add_user(self)
      puts "#{@name} ได้เข้าห้อง #{room.name}"
    end
  
    def send_message(room, content)
      message = Message.new(self, room, content)
      room.add_message(message)
      acknowledge_message(room, message)
    end
  
    def acknowledge_message(room, message)
      puts "#{@name} ส่งข้อความไปยัง #{room.name}: '#{message.content}'"
    end
  
    def to_s
      "User(name: #{@name})"
    end
  end
  
  class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  
    def to_s
      "Message(user: #{@user.name}, room: #{@room.name}, content: '#{@content}')"
    end
  end
  

  room1 = Room.new("Conference Room", "ห้องสำหรับประชุม")
  user1 = User.new("jay")
  
  user1.enter_room(room1)
  user1.send_message(room1, "สวัสดีค่ะทุกคน!")
  
  puts room1  
  

# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)
class Room
    attr_accessor :name, :description, :users, :messages
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
      @messages = []
    end
  
    def add_user(user)
      @users << user
    end
  
    def remove_user(user)
      @users.delete(user)
    end
  
    def add_message(message)
      @messages << message
    end
  
    def broadcast(message)
      puts "กำลังส่งข้อความถึงผู้ใช้ทุกคนใน #{name}: '#{message.content}'"
      @users.each do |user|
        user.acknowledge_message(self, message)
      end
    end
  
    def to_s
      "Room(name: #{@name}, description: #{@description}, users: #{@users.map(&:name)}, messages: #{@messages.map(&:content)})"
    end
  end
  
  class User
    attr_accessor :name
  
    def initialize(name)
      @name = name
    end
  
    def enter_room(room)
      room.add_user(self)
      puts "#{@name} ได้เข้าห้อง #{room.name}"
    end
  
    def send_message(room, content)
      message = Message.new(self, room, content)
      room.add_message(message)
      acknowledge_message(room, message)
    end
  
    def acknowledge_message(room, message)
      puts "#{@name} ได้รับข้อความในห้อง #{room.name}: '#{message.content}'"
    end
  
    def to_s
      "User(name: #{@name})"
    end
  end
  
  class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  
    def to_s
      "Message(user: #{@user.name}, room: #{@room.name}, content: '#{@content}')"
    end
  end
  
  # ตัวอย่างการใช้งาน
  room1 = Room.new("Conference Room", "ห้องสำหรับประชุม")
  user1 = User.new("joy")
  user2 = User.new("jay")
  
  user1.enter_room(room1)
  user2.enter_room(room1)
  
  message = Message.new(user1, room1, "ขอให้ทุกคนเตรียมประชุม")
  room1.broadcast(message)  
  
  puts room1  
  