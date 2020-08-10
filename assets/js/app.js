import "../css/app.scss"

import "phoenix_html"
import {
  Socket
} from "phoenix"
import NProgress from "nprogress"
import {
  LiveSocket
} from "phoenix_live_view"
import "alpinejs"
const Hooks = {}


Hooks.code_mirror = {
  mounted () {
const editor = CodeMirror.fromTextArea(document.getElementById('cm_textarea'),
    {
      mode: "text/html",
      lineNumbers: true,
      theme: "material"
    });


    editor.on('change', (editor) => {
      // const text = editor.getValue()
      // this.pushEvent("change", {csv: text})
      editor.save()
    })
  }
}

Hooks.text_editor = {
  mounted() {

    ClassicEditor
    .create( document.querySelector( '#editor' ), {
      plugins: [ Autosave ],
      toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote', 'undo', 'redo' ],
      image: {
        toolbar: [ 'imageStyle:full', 'imageStyle:side', '|', 'imageTextAlternative' ],
      },
      autosave: {
        save( editor ) {
          // The saveData() function must return a promise
          // which should be resolved when the data is successfully saved.
          return saveData( editor.getData() );
        }
      }
    } );


  }
}


Hooks.ConnectionStatus = {
  mounted() {
    window.connected = true
  },
  disconnected() {
    window.connected = false
  },
  reconnected() {
    window.connected = true
  }
}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks, params: {_csrf_token: csrfToken}});


// Show progress bar on live navigation and form submits
window.addEventListener("phx:page-loading-start", info => NProgress.start())
window.addEventListener("phx:page-loading-stop", info => NProgress.done())

// connect if there are any LiveViews on the page
liveSocket.connect()

// liveSocket.enableDebug()
// liveSocket.enableLatencySim(1000)
window.liveSocket = liveSocket