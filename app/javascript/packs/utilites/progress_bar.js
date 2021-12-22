document.addEventListener('turbolinks:load', () => {
    const control = document.querySelector('.progress');
    if (control) {
        let progressBar = control.querySelector('.progress-bar')
        let total = progressBar.dataset.total
        let current = progressBar.dataset.current
        let progress = 100 * current / total
        progressBar.style.width = `${progress}%`
        progressBar.setAttribute('aria-valuenow', `${progress}`)
        console.log(progress)
    }
})
