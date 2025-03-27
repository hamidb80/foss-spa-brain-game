component Games {
  connect Application exposing { gname }

  fun render : Html {
    case gname {
      "blocks" => <Games.Blocks/>
      "shape-color" => <Games.ShapeColor/>
      "like-previous-shape" => <Games.LikePreviousShape/>
      
      => <span>"not found"</span>
    }
  }
}
