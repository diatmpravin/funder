FactoryGirl.define do
  sequence :name do |n|
    "Foo bar #{n}"
  end
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :uid do |n|
    "#{n}"
  end
  sequence :site do |f|
    f.name { Factory.next(:name) }
    f.title { Factory.next(:name) }
    f.path { Factory.next(:name) }
    f.host { Factory.next(:name) }
    f.gender "male"
    f.email { Factory.next(:email) }
    f.twitter "foobar"
    f.facebook "http://www.facebook.com/FooBar"
    f.blog "http://blog.foo.bar"
  end
  sequence :user do |f|
    f.provider "twitter"
    f.uid { Factory.next(:uid) }
    f.name "Foo bar"
    f.email { Factory.next(:email) }
    f.bio "This is Foo bar's biography."
    f.association :site, :factory => :site
  end
  sequence :category do |f|
    f.name { Factory.next(:name) }
  end
  sequence :project do |f|
    f.name "Foo bar"
    f.association :site, :factory => :site
    f.association :user, :factory => :user
    f.association :category, :factory => :category
    f.about "Foo bar"
    f.headline "Foo bar"
    f.goal 10000
    f.expires_at { 1.month.from_now }
    f.video_url 'http://vimeo.com/17298435'
  end
  sequence :reward do |f|
    f.association :project, :factory => :project
    f.minimum_value 1.00
    f.description "Foo bar"
  end
  sequence :backer do |f|
    f.association :project, :factory => :project
    f.association :user, :factory => :user
    f.association :site, :factory => :site
    f.confirmed true
    f.value 10.00
  end
  sequence :oauth_provider do |f|
    f.name 'GitHub'
    f.strategy 'GitHub'
    f.path 'github'
    f.key 'test_key'
    f.secret 'test_secret'
  end
  sequence :configuration do |f|
    f.name 'Foo'
    f.value 'Bar'
  end
end