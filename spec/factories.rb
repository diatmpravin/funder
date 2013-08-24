
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

  sequence :user do |f|
    f.provider "twitter"
    f.uid { FactoryGirl.next(:uid) }
    f.name "Foo bar"
    f.email { FactoryGirl.next(:email) }
    f.bio "This is Foo bar's biography."
  end

  sequence :category do |f|
    f.name { FactoryGirl.next(:name) }
  end

  sequence :project do |f|
    f.name "Foo bar"
    f.association :user, :FactoryGirl => :user
    f.association :category, :FactoryGirl => :category
    f.about "Foo bar"
    f.headline "Foo bar"
    f.goal 10000
    f.deadline { 1.month.from_now }
    f.video_url 'http://vimeo.com/17298435'
  end

  sequence :reward do |f|
    f.association :project, :FactoryGirl => :project
    f.minimum_value 1.00
    f.description "Foo bar"
  end

  sequence :backer do |f|
    f.association :project, :FactoryGirl => :project
    f.association :user, :FactoryGirl => :user
    f.confirmed true
    f.value 10.00
  end

  sequence :oauth_provider do |f|
    f.name 'github'
    f.key 'test_key'
    f.secret 'test_secret'
  end

end

#FactoryGirl.define :user do |f|
#  f.provider "twitter"
#  f.uid { FactoryGirl.next(:uid) }
#  f.name "Foo bar"
#  f.email { FactoryGirl.next(:email) }
#  f.bio "This is Foo bar's biography."
#end
#FactoryGirl.define :category do |f|
#  f.name { FactoryGirl.next(:name) }
#end
#FactoryGirl.define :project do |f|
#  f.name "Foo bar"
#  f.association :user, :FactoryGirl => :user
#  f.association :category, :FactoryGirl => :category
#  f.about "Foo bar"
#  f.headline "Foo bar"
#  f.goal 10000
#  f.deadline { 1.month.from_now }
#  f.video_url 'http://vimeo.com/17298435'
##end
#FactoryGirl.define :reward do |f|
#  f.association :project, :FactoryGirl => :project
#  f.minimum_value 1.00
#  f.description "Foo bar"
#end
#FactoryGirl.define :backer do |f|
#  f.association :project, :FactoryGirl => :project
#  f.association :user, :FactoryGirl => :user
#  f.confirmed true
#  f.value 10.00
#end
#FactoryGirl.define :oauth_provider do |f|
#  f.name 'github'
#  f.key 'test_key'
#  f.secret 'test_secret'
#end
