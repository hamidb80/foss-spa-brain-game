// This is the component which gets rendered on the screen
component Main {
  connect Application exposing { page }

  fun render : Html {
    case page {
      Page.Home  => <Home/>
      Page.Games => <Games/>
    }
  }
}
