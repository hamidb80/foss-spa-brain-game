component Games {
  connect Application exposing { gname }

  fun render : Html {
    <div class="container">
      case gname {
        "blocks" => <Games.Blocks/>
        
        => <span>"not found"</span>
      }
    </div>
  }
}
