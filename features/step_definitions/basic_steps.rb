When("I visit the site") do
  visit root_path
end

Given("the following post exists") do |table|
  table.hashes.each do |post_hash|
    user = User.find_by_name(post_hash[:user])
    FactoryBot.create(:post, post_hash.merge(user: user))
  end
end

Given("the following user(s) exists") do |table|
  table.hashes.each do |user_hash|
    FactoryBot.create(:user, user_hash)
  end
end

Given("I am logged in as {string}") do |text|
  user = User.find_by(email: text) || User.find_by(name: text)
  login_as user, scope: :user
end

When("I fill the {string} with {string}") do |field, input|
  fill_in field, with: input
end

When("I click on {string}") do |string|
  first(:link, string).click
end

When("I click {string}") do |string|
  click_on string
end


Then("show me the page") do
  save_and_open_page
end



