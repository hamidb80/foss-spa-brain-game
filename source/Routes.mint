routes {
  / {
    Application.setPage(Page.Home)
  }

  /games/:game (game: String) {
    Application.setPage(Page.Games)
    Application.setGame(game)
  }

  * {
    Application.setPage(Page.Error404)
  }
}