import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="zebra"
export default class extends Controller {
  connect() {
  }

  async print({ params: { zpl } }) {
    await fetch("http://127.0.0.1:9100/write", {
      "credentials": "omit",
      "headers": {
          "Accept": "*/*",
          "Accept-Language": "en-US,en;q=0.5",
          "Content-Type": "text/plain;charset=UTF-8"
      },
      "body": `{\"device\":{\"name\":\"54j151302081\",\"uid\":\"54j151302081\",\"connection\":\"usb\",\"deviceType\":\"printer\",\"version\":2,\"provider\":\"com.zebra.ds.webdriver.desktop.provider.DefaultDeviceProvider\",\"manufacturer\":\"Zebra Technologies\"},\"data\":\"${zpl}\"}`
      ,
      "method": "POST",
      "mode": "cors"
  });
  }
}