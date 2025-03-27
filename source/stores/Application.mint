type Page {
  Home
  Games
}

store Application {
  state page : Page = Page.Home
  state gname: String = ""

  state windowWidth: Number = 0
  state windowHeight: Number = 0
  state prepared: Bool = false

  fun updateWindowSize {
    next { windowWidth: Window.width(),
           windowHeight: Window.height() }
  }

  fun prepare(){
    if prepared == false {

      Window.addEventListener("resize", true, (event : Html.Event) {
        updateWindowSize()
      })

      next { prepared: true }
      updateWindowSize()
    }
  }

  fun setPage (page : Page) : Promise(Void) {
    prepare()
    next { page: page }
  }

  fun setGame (name : String) : Promise(Void) {
    next { gname: name }
  }
}