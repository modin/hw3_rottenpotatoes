# Add a declarative step here for populating the DB with movies.
Given /the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
#puts movie.to_s
  Movie.create!(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to: the database here.
  end
#  assert false, "Unimplmemented"
end

#parte 2, b
Given /^I check the following ratings: (.*)/ do |ratings|
  ratings.split(", ").each do |m|
    puts %Q{I check "ratings_#{m}"}
    When %Q{I check "ratings_#{m}"}
  end
end

#parte 2, c
Then /^I should see all of the movies$/ do
assert page.all('table#movies/tbody tr').count == 10

#  puts page.all(:xpath, '//table[@id="movies"]//tr').to_s
#  puts page.all(:xpath, '//table[@id="movies"]/tbody/tr').count.to_s
#  puts page.all(:xpath, '//table[@id="movies"]/tbody/tr').count == 10
#  assert page.all(:xpath, '//table[@id="movies"]/tbody/tr').count == 10
end

Then /^I should see no movies$/ do
  assert page.all('table·movies/tbody tr').count == 0
end


Given /^I uncheck the following ratings: (.*)/ do |ratings|
  ratings.split(", ").each do |m|
    When %Q{I uncheck "ratings_#{m}"}
  end
end
# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  assert false, "Unimplmemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

#When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
#end
