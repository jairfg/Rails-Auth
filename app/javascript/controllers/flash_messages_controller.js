import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toast"]

  closeAll() {
    this.toastTargets.forEach(toast => {
      toast.classList.add('toast-exit')
      setTimeout(() => toast.remove(), 300)
    })
  }

  get toastCount() {
    return this.toastTargets.length
  }
}