# frozen_string_literal: true

users = User.create!([
                      { first_name: 'Sasha',last_name: 'Yoyo' , email: 'sasha@gmail.com', password: '123456' },
                      { first_name: 'Masha',last_name: 'Yoyo' , email: 'masha@gmail.com', password: '123456' },
                      { first_name: 'Dasha',last_name: 'Yoyo' , email: 'dasha@gmail.com', password: '123456' },
                      { first_name: 'Vasya',last_name: 'Yoyo' , email: 'vasya@gmail.com', password: '123456' },
                      { first_name: 'Govar',last_name: 'Yoyo' , email: 'govar@gmail.com', password: '123456' }
  ])

categories = Category.create!([
                      { title: 'Frontend' },
                      { title: 'Backend' },
                      { title: 'Fullsteck' }
  ])

tests = Test.create!([
                      { title: 'Test 1', level: 0, category: categories[0],
                        author: users[0] },
                      { title: 'Test 2', level: 1, category: categories[0],
                        author: users[0] },
                      { title: 'Test 3', level: 2, category: categories[2],
                        author: users[0] },
                      { title: 'Test 4', level: 3, category: categories[1],
                        author: users[-1] },
                      { title: 'Test 5', level: 4, category: categories[2],
                        author: users[-1] }
  ])

questions = Question.create!([
                      { body: 'What about some different things in HTML?', test: tests[0] },
                      { body: 'What about some different things in Javascript?', test: tests[1] },
                      { body: 'What about some different things in Ruby?', test: tests[-1] }
  ])

ansewrs= Answer.create!([
                      { body: 'answer 1', correct: true, question: questions[0] },
                      { body: 'answer 2', correct: false, question: questions[0] },
                      { body: 'answer 3', correct: true, question: questions[1] },
                      { body: 'answer 4', correct: false, question: questions[1] },
                      { body: 'answer 5', correct: true, question: questions[2] },
                      { body: 'answer 6', correct: false, question: questions[2] }
  ])
