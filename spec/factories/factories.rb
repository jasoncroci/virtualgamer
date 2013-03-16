FactoryGirl.define do
  
  factory :player do
  	race 1
  	class_name "Fighter"
  	alignment 1
  end

  factory :monster do
  	display_name "Monster1"
  	type "Beast"
  	experience_points 1000
  end

  factory :data_block do
    name "Agarth"
    size  1
    level 10
    speed 30
    hit_points 100
    armor_class 20
    association :shareable, factory: :player
  end

end