2.times do |i|
  diary = Diary.create({title: "Diary #{i}", kind: rand(0..1), expiration: DateTime.now + rand(1..30).minutes})
  3.times do
    diary.notes.create({text: "Random text"})
  end
end

2.times do |i|
  diary = Diary.create({title: "Diary #{i}", kind: rand(0..1), expiration: DateTime.now + 10.minutes})
  3.times do
    diary.notes.create({text: "Random text"})
  end
end
