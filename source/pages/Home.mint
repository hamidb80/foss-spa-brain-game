component Home {

  const GAMES = [
    ["blocks", "memory block"]
  ]

  style logo {
    width: 60px;
    height: 60px;

    *{
      max-width: 100%;
      max-height: 100%;
    }
  }

  // Renders the component.
  fun render : Html {
    <div>

      <div class="container">
        <div class="d-flex justify-content-center">
          <div::logo>
            @svg(../../assets/brain-puzzled.svg)
          </div>
        </div>

        <h1>
          <i class="bi bi-joystick me-3"></i>
          "games list"
        </h1>
        
        <ul>
          for [path, name] of GAMES {
            <li>
              <a href="/games/#{path}"> name </a>
            </li>
          }
        </ul>
        
      </div>
    </div>
  }
}
