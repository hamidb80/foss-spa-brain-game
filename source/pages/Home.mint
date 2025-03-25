component Home {

  const GAMES = [
    ["blocks", "memory block"]
  ]

  // Renders the component.
  fun render : Html {
    <div>
      <h1>
        "games list"
      </h1>
      
      <ul>
        for [path, name] of GAMES {
          <li>
            <a href={"/games/" + path }> name </a>
          </li>
        }
      </ul>
    </div>
  }
}
