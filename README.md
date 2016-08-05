## README

### Assumptions

* Ruby - 2.2.3
* Rails - 4.2
* Postgres

To keep it simple, there is a `org_id` column in the `events` table to support multi-tenancy.

However, if I were to do it right, I'd use a gem such as `apartment` or write a custom implementation of true multi-tenancy, which would either store org records in different databases or separate schemas (if Postgres)

### Setup

```
git clone git@github.com:blizkreeg/newrelic_vineet
cd newrelic_vineet
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed (this creates a few orgs and fake events)
```

### Services

There is a `POST create` service API to create/store a new event. A test for this can be found in `spec/controllers/events_controller_spec.rb`.

### Models

```
Org
- name
- domain

Event
- ts (timestamp)
- name (event name)
- hostname (event host)
```

The following scopes are defined for the two queries in the `Event` model:

```
scope :last_n, -> (org, n) { where(org_id: org.id).order("ts DESC").limit(n) }
scope :last_n_for_host, -> (org, n, host) { where(org_id: org.id).where(hostname: host).order("ts DESC").limit(n) }
```

### How to run the test suite

There are two tests - one for the POST service to create/store a new event and a unit test to retrieve the last N events for an org

Run the test suite:

```
bundle exec rspec spec/ --format d
```

You may test with `rails console` too.

For example:

```
$ rails c
$ Event.last_n(Org.first, 100) -> would return N records in reverse chron order for the given org
$ Event.last_n(Org.first, 100, "facebook-04") -> would return N records in reverse chron order for a specific host within the given org
(you'll need to make sure the hostname is present in the database)
```
