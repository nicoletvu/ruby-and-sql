# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

reachout_jeff_1 = Activity.new
jeff = Contact.find_by({"first_name" => "Jeff"})
reachout_jeff_1["contact_id"] = jeff["id"]
kona = Salesperson.find_by({"first_name" => "Kona"})
reachout_jeff_1["salesperson_id"] = kona["id"]
reachout_jeff_1["notes"] = "Jeff picked up the phone and then hung up immediately"
reachout_jeff_1.save

reachout_jeff_2 = Activity.new
reachout_jeff_2["contact_id"] = jeff["id"]
reachout_jeff_2["salesperson_id"] = kona["id"]
reachout_jeff_2["notes"] = "Jeff sent a cease-and-desist letter"
reachout_jeff_2.save

reachout_tim = Activity.new
tim = Contact.find_by({"first_name" => "Tim"})
reachout_tim["contact_id"] = tim["id"]
reachout_tim["salesperson_id"] = kona["id"]
reachout_tim["notes"] = "Invited Tim for coffee"
reachout_tim.save


# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):
puts "Activities between Kona and Jeff Bezos:"
kona_jeff_activity = Activity.where("contact_id" => jeff["id"],"salesperson_id" => kona["id"])
for activity in kona_jeff_activity
    puts "- #{activity["notes"]}"
end
# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
