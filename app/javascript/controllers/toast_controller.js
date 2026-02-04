import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    duration: { type: Number, default: 5000 }
  }

  connect() {
    this.startTimer()
  }

  startTimer() {
    this.timeout = setTimeout(() => {
      this.close()
    }, this.durationValue)
  }

  close() {
    this.element.classList.add('toast-exit')
    setTimeout(() => {
      this.element.remove()
    }, 300)
  }

  stopTimer() {
    if (this.timeout) {
      clearTimeout(this.timeout)
    }
  }

  disconnect() {
    this.stopTimer()
  }
}