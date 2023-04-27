# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.

salesperson1 = Salesperson.new
salesperson1["first_name"] = "Kona"
salesperson1["last_name"] = "Vu-Shea"
salesperson1["email"] = "konalovessticks@gmail.com"
salesperson1.save # actually add to table

salesperson2 = Salesperson.new
salesperson2["first_name"] = "Tofu"
salesperson2["last_name"] = "Vu"
salesperson2["email"] = "tofu-the-lamb@gmail.com"
salesperson2.save # actually add to table

# 3. write code to display how many salespeople rows are in the database

# puts "There are #{Salesperson.all.count} salespeople"

# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.

tofu = Salesperson.find_by({"first_name" => "Tofu"})
tofu["email"] = "tofu-lamb@gmail.com" # assign it something
tofu.save # updates
# puts tofu["email"]

# CHALLENGE:
# 5. write code to display each salesperson's full name

kona = Salesperson.find_by({"first_name" => "Kona"})
kona_full_name = "#{kona["first_name"]} #{kona["last_name"]}"
tofu_full_name = "#{tofu["first_name"]} #{tofu["last_name"]}"
puts "There are #{Salesperson.all.count} salespeople:"
puts "#{kona_full_name}"
puts "#{tofu_full_name}"

# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng
