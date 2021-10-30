

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
  {title: 'Test 1', level: 0, category_id: Category.ids.sample,
    author_id: User.first.id, user_id: User.ids.sample},
  {title: 'Test 2', level: 0, category_id: Category.ids.sample,
    author_id: User.first.id, user_id: User.ids.sample},
  {title: 'Test 3', level: 2, category_id: Category.ids.sample,
    author_id: User.last.id, user_id: User.ids.sample},
  {title: 'Test 4', level: 1, category_id: Category.ids.sample,
    author_id: User.last.id, user_id: User.ids.sample},
  {title: 'Test 5', level: 2, category_id: Category.ids.sample,
    author_id: User.last.id, user_id: User.ids.sample}
])

Question.create!([
  {body: 'What about some different things in HTML?', test_id: Test.ids.sample},
  {body: 'What about some different things in Javascript?', test_id: Test.ids.sample},
  {body: 'What about some different things in Ruby?', test_id: Test.ids.sample}
])

Answer.create!([
  {body: 'answer 1', correct: true, question_id: Question.ids.sample },
  {body: 'answer 2', correct: false, question_id: Question.ids.sample},
  {body: 'answer 3', correct: true, question_id: Question.ids.sample },
  {body: 'answer 4', correct: false, question_id: Question.ids.sample },
  {body: 'answer 5', correct: true, question_id: Question.ids.sample },
  {body: 'answer 6', correct: false, question_id: Question.ids.sample }
])
