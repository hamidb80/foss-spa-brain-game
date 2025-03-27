type Games.ShapeColor.Flow {
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

  // ------------------------------------------------------------

  state flow = Games.ShapeColor.Flow.Stopped
  state score: Number = 0
  state shapeDataPath : String = ""
  state color1 : NamedColor = Colors.EMPTY
  state color2 : NamedColor = Colors.EMPTY
  state color3 : NamedColor = Colors.EMPTY

  // ------------------------------------------------------------

  fun pass (isCorrect: Bool) {
    next {score: score + Bool.toSign(isCorrect == (color1.name == color3.name))}
    startGame()
  }

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

  fun startGame () {
    let c = randomColor()

    next { 
      flow: Games.ShapeColor.Flow.Running,
      shapeDataPath: randomShape(scale),
      color1: c,
      color2: randomColor(),
      color3: 
        if Random.bool(0.45) {c}  
        else {randomColor()},
    }
  }

  fun init {
    if flow == Games.ShapeColor.Flow.Stopped {
      startGame()
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
      </div>

      <div class="d-flex justify-content-center">
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
      </div>

    </>
  }
}
