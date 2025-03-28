type Games.LikePreviousShape.Phases {
  Before
  GameOver
  Ready
  Hide
  Decide
}

type Games.LikePreviousShape.State {
  color: NamedColor,
  dpath: String
}

locale en {
  score: "score",
  isTheSame: "is the same?",
  start: "start",
  ready: "ready?",
  gameover: "game over",
  restart: "re-start",
}

component Games.LikePreviousShape {
  connect Application exposing { windowWidth, windowHeight }
  
  property colors: Array(NamedColor) = Colors.DEFAULTS
  property shapes: Array(Function(Number, String)) = ShapeGenerator.ALL
  
  property scale : Number = 200
  property changeProb: Number = 0.5
  property delay: Number = 1200
  property initialLives: Number = 3

  // ------------------------------------------------------------

  state score: Number = 0
  state lives: Number = 0
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
     color: randomColor()}
  }

  // ------------------------------------------------------------

  fun startGame {
    next { score: 0, lives: initialLives }
  }

  fun initGame {
    next { phase: Games.LikePreviousShape.Phases.Before,
           history: [], }
  }

  fun nextStep (delayed: Bool): Promise(Void) {
    await if delayed {
      next { phase: Games.LikePreviousShape.Phases.Hide }
      Timer.timeout(delay)
    }

    next {history: Array.push(history, {
        case Array.last(history) {
          Maybe.Nothing => randomState()
          Maybe.Just(v) => {
            dpath: 
              if Random.bool(changeProb) {randomShape()}
              else {v.dpath},
            color:
              if Random.bool(changeProb) {randomColor()}
              else {v.color}
          }
        }
      }
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
      let result = Bool.toNumber(isCorrect == won())
      next {score: score + result, 
            lives: lives -1 + result}

      if lives == 0 {
        next {phase: Games.LikePreviousShape.Phases.GameOver}
      }
      else {
        nextStep(true)
      }
    }
  }

  // ------------------------------------------------------------

  fun render {
    case history |> Array.last(){
      Maybe.Nothing => {
        nextStep(false)
        startGame()
        <span> "wait" </span>
      }
      Maybe.Just(cur) => <>
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

            if phase == Games.LikePreviousShape.Phases.GameOver {
              <div>
                <h1>
                  :gameover
                </h1>
                <div class="d-grid gap-2 w-100 mt-4">
                  <button class="btn btn-outline-info" onClick={() {initGame()}}>
                    :restart
                  </button>
                </div>
              </div>
            }
            else {
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
                      fill={cur.color.code} 
                      />
                  </svg>
                </div>

                <div class="card-body d-flex justify-content-between bg-light"> 
                  if phase == Games.LikePreviousShape.Phases.Ready {
                    <div class="d-grid gap-2 w-100">
                      <button class="btn btn-outline-primary" onClick={() {nextStep(true)}}>
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
            }
          </div>

        </>
    }
  }
}
