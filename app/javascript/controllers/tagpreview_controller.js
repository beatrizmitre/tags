import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "kmatual", "contakm" ]

  somakm() {
    showkm()
    console.log(this.contakmTarget.value)
  }
  
  showkm() {
    return this.kmatualTarget.innerText
  }

  
}