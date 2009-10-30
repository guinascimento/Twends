Given /^the following view_photos:$/ do |view_photos|
  ViewPhotos.create!(view_photos.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) view_photos$/ do |pos|
  visit view_photos_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following view_photos:$/ do |expected_view_photos_table|
  expected_view_photos_table.diff!(table_at('table').to_a)
end
