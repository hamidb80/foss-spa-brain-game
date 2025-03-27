module Router {
  const BASE_URL = "/suburl"
}

routes {
  /suburl/ {
    Application.setPage(Page.Home)
  }

  /suburl/games/:game (game: String) {
    Application.setPage(Page.Games)
    Application.setGame(game)
  }

  * {
    Window.navigate(Router.BASE_URL)
  }
}