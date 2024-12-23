import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="encrenca"
export default class extends Controller {
  connect() {
    BrowserPrint.getDefaultDevice("printer", device => this.selected_device = device)
  }

  async print({params: { zpl, tag } }) {
    console.log(this.selected_device.name)
    console.log(zpl)
    this.selected_device.send(zpl)
    this.tell(tag)
  }

  async tell(tag_id) {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    await fetch('/print_button_clicks', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({ tag_id: tag_id })
    })
  }

}
