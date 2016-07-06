require_relative('../models/athlete.rb')
require_relative('../models/event.rb')

Medal.delete_all()
Athlete.delete_all()
Nation.delete_all()
Event.delete_all()


nation1 = Nation.new({'name' => 'UK', 'points' => 0}).save
nation2 = Nation.new({'name' => 'Germany', 'points' => 0}).save
nation3 = Nation.new({'name' => 'France', 'points' => 0}).save


athlete1 = Athlete.new({'name' => 'Sam', 'nation_id' => nation1.id}).save
athlete2 = Athlete.new({'name' => 'Hans', 'nation_id' => nation2.id}).save
athlete3 = Athlete.new({'name' => 'Pierre', 'nation_id' => nation3.id}).save

event1 = Event.new({'name' => 'Long Jump'}).save
event2 = Event.new({'name' => 'Synchronised Swimming'}).save
event3 = Event.new({'name' => 'Caber Toss'}).save

medal1 = Medal.new({'type' => 'Gold', 'athlete_id' => athlete1.id, 'event_id' => event1.id}).save
medal2 = Medal.new({'type' => 'Silver', 'athlete_id' => athlete2.id, 'event_id' => event1.id}).save
medal3 = Medal.new({'type' => 'Bronze', 'athlete_id' => athlete3.id, 'event_id' => event1.id}).save
medal4 = Medal.new({'type' => 'Silver', 'athlete_id' => athlete1.id, 'event_id' => event2.id}).save
