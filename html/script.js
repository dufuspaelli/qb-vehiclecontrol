// Looking for the v1.5 template?
// https://codepen.io/pen?template=GVoaNe

const App = {
  template: '#app-template',
  data: () => ({
    //
    action : '',
    value : '',
    show: false,
    engine: false,
  }),
  mounted() { 
    this.listener = window.addEventListener('keyup', (ev) => {
      if (ev.key == 'Escape' || ev.key == "g") {
        this.show = false
        const requestOptions = {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ close: 'close' })
        };
        fetch("https://qb-vehiclecontrol/close", requestOptions)
      }
     // self.myMethod(ev); // declared in your component methods
    })
    this.listener = window.addEventListener("message", (event) => {

      this.engine = event.data.engine == 1 ? false : true
      this.show = true
    });
  }, 
  methods: {
    actionHandle(type, value) {
      // console.log(type,value)
      if (type == "engine") {
        this.engine = !this.engine
        console.log(this.engine)
      }
      const requestOptions = {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ type: type, value: value })
      };
      fetch("https://qb-vehiclecontrol/cb", requestOptions)
        .then(response => response.json())
        .then(data => {
          document.activeElement.blur();
        })
        .catch((error) => {
        })
    }
  }
}


new Vue({
  vuetify: new Vuetify({
  icons: {
    iconfont: 'fa',
  },
}),
  render: h => h(App)
}).$mount('#app')
