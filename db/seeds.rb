require 'faker'

5.times do
  User.create( name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password )
end

5.times do
  Category.create(title: Faker::ProgrammingLanguage.name)
end

5.times do
  category = Category.find_by(title: Category.pluck(:title).sample)
  
  Test.create(title: category.title, level: (1..5).to_a.sample, 
              category_id: category.id,
              user_id: User.find(User.pluck(:id).sample).id, author_id: Faker::Number.digit)
end

5.times do
  Question.create(body: Faker::Lorem.question(word_count: 4), test_id: Test.find(Test.ids.sample).id )
end

5.times do
  Answer.create(correct: [true, false].sample, question_id: Question.find(Question.ids.sample).id )
end