FactoryGirl.define do
	factory :user do
	    sequence(:name)  { |n| "Person #{n}" }
	    sequence(:email) { |n| "person_#{n}@example.com"}
	    password "foobar"
	    password_confirmation "foobar"

	    factory :admin do
	    	admin true
	    end
	end

	factory :project do 
		sequence(:name) { |n| "Project #{n}" }
	end

	factory :milestone do
		sequence(:name) { |n| "Milestone #{n}" }
		rand_time = rand(-7..7)
		end { rand_time.days.from_now }
	end

end