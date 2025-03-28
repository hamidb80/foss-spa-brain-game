type Games.ShapeColor.Phase {
  GameOver
  Stopped
  Running
}

locale en {
  score: "score",
}

component Games.ShapeColor {
  property colors: Array(NamedColor) = Colors.DEFAULTS
  property shapes: Array(Function(Number, String)) = ShapeGenerator.ALL

  property scale : Number = 200
  property initialLives : Number = 3

  // ------------------------------------------------------------

  state phase = Games.ShapeColor.Phase.Stopped
  state score: Number = 0
  state lives: Number = 0
  state shapeDataPath : String = ""
  state color1 : NamedColor = Colors.EMPTY
  state color2 : NamedColor = Colors.EMPTY
  state color3 : NamedColor = Colors.EMPTY

  // ------------------------------------------------------------

  fun randomColor {
    colors 
    |> Array.sample() 
    |> Maybe.withDefault(Colors.EMPTY)
  }

  fun randomShape(scale: Number) {
    case Array.sample(shapes) {
      Maybe.Just(fn) => fn(scale)
      Maybe.Nothing => ""
    }
  }

  // ------------------------------------------------------------

  fun resetGame {
    next { lives: initialLives,
           score: 0,
           phase: Games.ShapeColor.Phase.Stopped }
  }

  fun init {
    if phase == Games.ShapeColor.Phase.Stopped {
      next { lives: initialLives }
      nextStep()
    }
  }
  
  fun pass (isCorrect: Bool) {
    let result = Bool.toNumber(isCorrect == (color1.name == color3.name))
    next {score: score + result,
          lives: lives -1 + result  }

    if lives == 0 {
      next {phase: Games.ShapeColor.Phase.GameOver}
    }
    else {
      nextStep()
    }
  }

  fun nextStep () {
    let c = randomColor()

    next { 
      phase: Games.ShapeColor.Phase.Running,
      shapeDataPath: randomShape(scale),
      color1: c,
      color2: randomColor(),
      color3: 
        if Random.bool(0.45) {c}  
        else {randomColor()},
    }
  }

  // ------------------------------------------------------------

  fun render {
    init()

    <>
      <div class="container my-4">
        <h2 class="text-center">
          :score  ": " score
        </h2>
        <h3 class="text-center">
          for i of Array.range(1, lives) {
            <i class="bi bi-heart text-danger mx-1"></i>
          }
        </h3>
      </div>

      <div class="d-flex justify-content-center">

        if phase == Games.ShapeColor.Phase.GameOver {
          <div>
            <h1>
              :gameover
            </h1>
            <div class="d-grid gap-2 w-100 mt-4">
              <button class="btn btn-outline-info" onClick={() {resetGame()}}>
                :restart
                <i class="bi bi-play mx-1"></i>
              </button>
            </div>
          </div>
        }
        else {
          <div class="card shadow-sm overflow-hidden">

            <div class="card-body">
              <h3 class="card-title text-center" style={{"color" => color2.code}} >
                {color3.name}
              </h3>
            </div>

            <div class="card-img-top text-center px-5 pb-2">
              <svg
                width="#{scale}"
                height="#{scale}"
                >
                <path 
                  d={shapeDataPath} 
                  fill={color1.code} 
                  />
              </svg>
            </div>

            <div class="card-body d-flex justify-content-between bg-light"> 
              <button class="btn btn-outline-danger" onClick={() {pass(false)}}>
                <i class="bi bi-x-lg"></i>
              </button>
      
              <button class="btn btn-outline-success" onClick={() {pass(true)}}>
                <i class="bi bi-check-lg"></i>
              </button>
            </div>
          </div>
        }
      </div>

    </>
  }
}
