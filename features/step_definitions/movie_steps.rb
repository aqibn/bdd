# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  movie = Movie.create!(movie) 
   end
  #flunk "Unimplemented"
end


# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  
  a = page.body.index(e1)
  b = page.body.index(e2)
  
  a < b
 # flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(', ')
    ratings.each do |rat|
      if uncheck 
      step "I uncheck \"#{rat}\""
    else
      step "I check \"#{rat}\""
   end
 end
 # flunk "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  rows = page.all('#movies tr')
rows.length.should == Movie.all.length+1
  #flunk "Unimplemented"
end


Then /the following ratings should (not_)?be visible: (.*)/ do |not_be, rating_list|
ratings = rating_list.split(', ')
  ratings.each do |rat|
    if not_be 
      step "the \"#{rat}\" checkbox should not be checked"
    else 
      step "the \"#{rat}\" checkbox should be checked"
  end
end
end



