document.addEventListener('turbolinks:load', function () {
  let controls = document.querySelectorAll('.form-inline-link')
  if (controls.length){
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler)
    }
  }
  let errors = document.querySelector('.resource-errors')

  if (errors) {
    let resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})
const formInlineLinkHandler = (event) => {
  event.preventDefault()
  let testId = event.target.dataset.testId
  formInlineHandler(testId)
}
const formInlineHandler = (testId) => {
  let link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
  let testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`)
  let formInLine = document.querySelector(`.form-inline[data-test-id="${testId}"]`)
  if (!formInLine) return 
  if (formInLine.classList.contains('hide')){
    testTitle.classList.add('hide')
    formInLine.classList.remove('hide')
    link.textContent = 'Cancel'
  } else {
    testTitle.classList.remove('hide')
    formInLine.classList.add('hide')
    link.textContent = 'Edit'
  }
}
