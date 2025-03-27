type Games.LikePreviousShape.Phases {
  Before
  Ready
  Hide
  Decide
}

type Games.LikePreviousShape.State {
  color: ShapeColor,
  dpath: String
}

locale en {
  score: "score",
  isTheSame: "is the same?",
  start: "start",
  ready: "ready?",
}

component Games.LikePreviousShape {
  connect Application exposing { windowWidth, windowHeight }
  
  property colors: Array(NamedColor) = Colors.DEFAULTS
  property shapes: Array(Function(Number, String)) = ShapeGenerator.ALL
  
  property scale : Number = 200
  property strokeWidth : Number = 8
  property sameProbability = 0.35
  property delay = 600

  // ------------------------------------------------------------

  state score: Number = 0
  state phase = Games.LikePreviousShape.Phases.Before
  state history : Array(Games.LikePreviousShape.State) = []

  // ------------------------------------------------------------
  
  style cc {
    transition: opacity 0.3s ease-out;
  }
  
  // ------------------------------------------------------------

  fun won {
    case Array.takeEnd(history, 2) {
      [a, b] => a == b
      => false
    }
  }

  fun randomColor {
    Array.sample(colors) 
    |> Maybe.withDefault(Colors.EMPTY)
  }

  fun randomShape {
    let fn = 
      Array.sample(shapes) 
    |> Maybe.withDefault(ShapeGenerator.empty)

    fn(scale)
  }

  fun randomState {
    {dpath: randomShape(),
     color: {fg: randomColor(), bg: randomColor()}}
  }

  // ------------------------------------------------------------

  fun startGame (delayed: Bool): Promise(Void) {
    await if delayed {
      next { phase: Games.LikePreviousShape.Phases.Hide }
      Timer.timeout(delay)
    }

    next {history: Array.push(history, 
                  if Random.bool(1 - sameProbability) {
                    case Array.last(history) {
                      Maybe.Nothing => randomState()
                      Maybe.Just(v) => v
                    }
                  }
                  else { randomState() }
                  )}

    if delayed {
      next { phase:  Games.LikePreviousShape.Phases.Decide }
    }
    else {
      next { phase:  Games.LikePreviousShape.Phases.Ready }
    }
  }

  fun pass (isCorrect: Bool) {
    if phase == Games.LikePreviousShape.Phases.Decide {
      next {score: score + Bool.toSign(isCorrect == won())}
      startGame(true)
    }
  }

  // ------------------------------------------------------------

  fun render {
    case history |> Array.last(){
      Maybe.Nothing => {
        startGame(false)
        <span> "wait" </span>
      }
      Maybe.Just(cur) => <>
          <div class="container my-4">
            <h2 class="text-center">
              :score  ": " score
            </h2>
          </div>

          <div class="d-flex justify-content-center">
            <div::cc class="card shadow-sm overflow-hidden opacity-#{Bool.toNumber(phase !=  Games.LikePreviousShape.Phases.Hide) * 100}">

              <div class="card-body">
                <h3 class="card-title text-center">
                if phase == Games.LikePreviousShape.Phases.Ready {
                  :ready
                }
                else {
                  :isTheSame
                }
                </h3>
              </div>

              <div class="card-img-top text-center px-5 py-4">
                <svg
                  width="#{scale}"
                  height="#{scale}"
                  >
                  <path 
                    d={cur.dpath} 
                    fill={cur.color.bg.code} 
                    stroke={cur.color.fg.code}
                    stroke-width="#{strokeWidth}px"
                    />
                </svg>
              </div>

              <div class="card-body d-flex justify-content-between bg-light"> 
                if phase == Games.LikePreviousShape.Phases.Ready {
                  <div class="d-grid gap-2 w-100">
                    <button class="btn btn-outline-primary" onClick={() {startGame(true)}}>
                      :start
                    </button>
                  </div>
                }
                else {
                  <>
                    <button class="btn btn-outline-danger" onClick={() {pass(false)}}>
                      <i class="bi bi-x-lg"></i>
                    </button>
            
                    <button class="btn btn-outline-success" onClick={() {pass(true)}}>
                      <i class="bi bi-check-lg"></i>
                    </button>
                  </>
                }
              </div>
            </div>
          </div>

        </>
    }
  }
}
