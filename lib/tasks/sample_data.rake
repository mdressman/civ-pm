namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_projects
  end
end

def make_users
    
    admin = User.create!(name: "Example User",
                        email: "example@railstutorial.org",
                        password: "foobar",
                        password_confirmation: "foobar",
                        admin: true)
    99.times do |n|
        name  = Faker::Name.name
        email = "example-#{n+1}@railstutorial.org"
        password  = "password"
        User.create!(name: name,
                        email: email,
                        password: password,
                        password_confirmation: password)
    end
end

def make_projects
    50.times do
        name = Faker::Lorem.sentence(2)
        Project.create!(name: name)
    end
end