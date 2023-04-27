# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# puts "There are #{Company.all.count} companies"

# 2. insert new rows in companies table

new_company = Company.new
new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://www.apple.com"
new_company.save # actually add to table

new_company_2 = Company.new
new_company_2["name"] = "Amazon"
new_company_2["city"] = "Seattle"
new_company_2["state"] = "WA"
new_company_2["url"] = "https://www.amazon.com"
new_company_2.save # actually add to table

new_company_3 = Company.new
new_company_3["name"] = "Twitter"
new_company_3["city"] = "San Francisco"
new_company_3["state"] = "CA"
new_company_3["url"] = "https://www.twitter.com"
new_company_3.save # actually add to table

# puts new_company.inspect
# puts new_company_2.inspect
# puts new_company_3.inspect
# puts "There are #{Company.all.count} companies"

# 3. query companies table to find all row with California company

# all_companies = Company.all
# puts all_companies.inspect

# cali_companies = Company.where({"state" => "CA"}) #creating array based on specific filters
# puts cali_companies.inspect 
# puts "There are #{cali_companies.count} California companies in this table" #referencing array and counting up items in array

# 4. query companies table to find single row for Apple

# apple = Company.where({"name" => "Apple"})[0] #this method is fine... but it assumes it's the first and only thing in the array
apple = Company.find_by({"name" => "Apple"}) # automatically gives you one thing back... like vlookup
# puts apple.inspect

# 5. read a row's column value
# puts apple["url"]

# 6. update a row's column value

amazon = Company.find_by({"name" => "Amazon"})
amazon["url"] = "amazon.com" # assign it something
amazon.save # updates
puts amazon["url"]

# 7. delete a row
twitter = Company.find_by({"name" => "Twitter"})
twitter.destroy