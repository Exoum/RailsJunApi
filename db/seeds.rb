2.times do
  d = Diary.create({title: Faker::Name.name, kind: rand(0..1), expiration: Faker::Time.between(from: Date.today, to: Date.today + 14.days)})
  3.times do
    d.notes.create({text: Faker::Lorem.paragraph})
  end
end

2.times do
  d = Diary.create({title: Faker::Name.name, kind: rand(0..1), expiration: DateTime.now + 10.minutes})
  3.times do
    d.notes.create({text: Faker::Lorem.paragraph})
  end
end
