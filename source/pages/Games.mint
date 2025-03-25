component Games {
  connect Application exposing { gname }

  fun render : Html {
    case gname {
      "blocks" => <Games.Blocks/>
      
      => <span>"not found"</span>
    }
  }
}
