# require 'faker'
#
# 5.times do
#   User.create!( name: Faker::Name.name, email: Faker::Internet.email,
#                 password: Faker::Internet.password )
# end
#
# 5.times do
#   Category.create!(title: Faker::ProgrammingLanguage.name)
# end
#
# 5.times do
#   category_id = Category.ids.sample
#   user_id = User.ids.sample
#   author_id = Faker::Number.digit
#   n = Faker::Number.digit
#   Test.create!( title: "ToDo #{n}", level: (1..5).to_a.sample, category_id: category_id,
#                 user_id: user_id, author_id: author_id )
# end
#
# 5.times do
#   Question.create!(body: Faker::Lorem.question(word_count: 4), test_id: Test.ids.sample )
# end
#
# 5.times do
#   Answer.create!(correct: [true, false].sample, question_id: Question.ids.sample )
# end

User.create!([
  {name: 'Sasha', email: 'sasha@gmail.com', password: '123456'},
  {name: 'Masha', email: 'masha@gmail.com', password: '123456'},
  {name: 'Dasha', email: 'dasha@gmail.com', password: '123456'},
  {name: 'Vasya', email: 'vasya@gmail.com', password: '123456'},
  {name: 'Govar', email: 'govar@gmail.com', password: '123456'}
])

Category.create!([
  {title: 'HTML'},
  {title: 'Javascript'},
  {title: 'Ruby'}
])

Test.create!([
  {title: 'Test 1', level: 0, category_id: Category.first.id, author_id: User.first.id, user_id: User.first.id},
  {title: 'Test 2', level: 0, category_id: Category.all[1].id, author_id: User.all[1].id, user_id: User.first.id},
  {title: 'Test 3', level: 2, category_id: Category.all[2].id, author_id: User.all[2].id, user_id: User.first.id},
  {title: 'Test 4', level: 1, category_id: Category.all[0].id, author_id: User.all[3].id, user_id: User.first.id},
  {title: 'Test 5', level: 2, category_id: Category.all[2].id, author_id: User.all[4].id, user_id: User.first.id}
])

Question.create!([
  {body: 'What about some different things in HTML?', test_id: Test.first.id},
  {body: 'What about some different things in Javascript?', test_id: Test.all[1].id},
  {body: 'What about some different things in Ruby?', test_id: Test.all[2].id}
])

Answer.create!([
  {body: 'answer 1', correct: true, question_id: Question.first.id },
  {body: 'answer 2', correct: false, question_id: Question.all[0].id },
  {body: 'answer 3', correct: true, question_id: Question.all[1].id },
  {body: 'answer 4', correct: false, question_id: Question.all[1].id },
  {body: 'answer 5', correct: true, question_id: Question.all[2].id },
  {body: 'answer 6', correct: false, question_id: Question.all[2].id }
])
