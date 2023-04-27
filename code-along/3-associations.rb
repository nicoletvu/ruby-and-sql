# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database
puts "Companies: #{Company.all.count}"
puts "Contacts: #{Contact.all.count}"

# 1. insert new rows in the contacts table with relationship to a company
cook = Contact.new
cook["first_name"] = "Tim"
cook["last_name"] = "Cook"
cook["email"] = "tim@apple.com"

apple = Company.find_by({"name" => "Apple"})
cook["company_id"] = apple["id"]
cook.save

federighi = Contact.new
federighi["first_name"] = "Craig"
federighi["last_name"] = "Federighi"
federighi["email"] = "craig@apple.com"
federighi["company_id"] = apple["id"]
federighi.save

bezos = Contact.new
bezos["first_name"] = "Jeff"
bezos["last_name"] = "Bezos"
bezos["email"] = "bezos@amazon.com"
amazon = Company.find_by({"name" => "Amazon"})
bezos["company_id"] = amazon["id"]
bezos.save

apple_contacts = Contact.where("company_id" => apple["id"])
amazon_contacts = Contact.where("company_id" => amazon["id"])
puts "There are #{Contact.all.count} contacts"

# 2. How many contacts work at Apple?
puts "There are #{apple_contacts.count} contacts at Apple"

# 3. What is the full name of each contact who works at Apple?
for zebra in apple_contacts
    first_name = zebra["first_name"]
    last_name = zebra["last_name"]
    puts "#{first_name} #{last_name}"
end
