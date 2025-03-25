type Page {
  Home
  Games
  Error404
}

store Application {
  state page : Page = Page.Home
  state gname: String = ""

  fun setPage (page : Page) : Promise(Void) {
    Http.abortAll()
    next { page: page }
  }

  fun setGame (name : String) : Promise(Void) {
    next { gname: name }
  }
}