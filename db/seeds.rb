# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dummy_orgs = [
  {name: 'facebook', domain: 'facebook.com'},
  {name: 'newrelic', domain: 'newrelic.com'},
  {name: 'google', domain: 'google.com'},
  {name: 'twitter', domain: 'twitter.com'},
  {name: 'dropbox', domain: 'dropbox.com'},
  {name: 'airbnb', domain: 'airbnb.com'},
  {name: 'yelp', domain: 'yelp.com'}
]

dummy_orgs.each do |org_params|
  org = Org.create!(org_params)
  puts "created org #{org.name}"
  n = 10 + rand(100)
  n.times do
    org.events.build(ts: Time.at(rand(Time.now.to_i)), hostname: "#{org.name}-#{'%02d' % rand(10)}", name: "event #{SecureRandom.hex}")
  end
  puts "created #{n} events for #{org.name}"
  org.save!
end
