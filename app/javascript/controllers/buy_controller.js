import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "quantity", "dollars", "price" ]

  connect() {
    console.log('Hello, Stimulus!')
  }
  equal() {
    console.dir(this.priceTarget.value)
    this.dollarsTarget.value = ((this.quantityTarget.value * 100) * this.priceTarget.value / 100)
  }

  add() {
    this.quantityTarget.value = (this.dollarsTarget.value / this.priceTarget.value).toFixed(7);
  }
}
