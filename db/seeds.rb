# frozen_string_literal: true

users = User.create!([
                      { name: 'Sasha', email: 'sasha@gmail.com', password: '123456' },
                      { name: 'Masha', email: 'masha@gmail.com', password: '123456' },
                      { name: 'Dasha', email: 'dasha@gmail.com', password: '123456' },
                      { name: 'Vasya', email: 'vasya@gmail.com', password: '123456' },
                      { name: 'Govar', email: 'govar@gmail.com', password: '123456' }
  ])

categories = Category.create!([
                      { title: 'HTML' },
                      { title: 'Javascript' },
                      { title: 'Ruby' }
  ])

tests = Test.create!([
                      { title: 'Test 1', level: 0, category_id: categories[0].id,
                        author_id: users[0].id },
                      { title: 'Test 2', level: 0, category_id: categories[0].id,
                        author_id: users[0].id },
                      { title: 'Test 3', level: 2, category_id: categories[2].id,
                        author_id: users[0].id },
                      { title: 'Test 4', level: 1, category_id: categories[1].id,
                        author_id: users[-1].id },
                      { title: 'Test 5', level: 2, category_id: categories[2].id,
                        author_id: users[-1].id }
  ])

questions = Question.create!([
                      { body: 'What about some different things in HTML?', test_id: tests[0].id },
                      { body: 'What about some different things in Javascript?', test_id: tests[1].id },
                      { body: 'What about some different things in Ruby?', test_id: tests[-1].id }
  ])

ansewrs= Answer.create!([
                      { body: 'answer 1', correct: true, question_id: questions[0].id },
                      { body: 'answer 2', correct: false, question_id: questions[0].id },
                      { body: 'answer 3', correct: true, question_id: questions[1].id },
                      { body: 'answer 4', correct: false, question_id: questions[1].id },
                      { body: 'answer 5', correct: true, question_id: questions[2].id },
                      { body: 'answer 6', correct: false, question_id: questions[2].id }
  ])
  