type Games.Blocks.Phases {
  Ready
  Initial
  Prepare
  Select
  Reveal
}

type Games.Blocks.Record {
  level: Number,
  succeed: Bool
}

type Games.Blocks.Theme {
  inactiveFill : String,
  correctFill : String,
  missedFill : String,
  wrongFill : String,
  selectedFill : String,
  sampledFill : String,
}

locale en {
  ready: "Click on grid to start",
  level: "Level"
}

component Games.Blocks {
  connect Application exposing { windowWidth, windowHeight }

  property initialLevel = 3
  property stdDelay: Number = 1000
  property delay: Function(Number, Number) = (level: Number) { stdDelay + 200 * level }

  property theme : Games.Blocks.Theme = {
    inactiveFill: "#EAEAEA",
    correctFill: "#81DAE3",
    missedFill: "#888888",
    wrongFill: "#FF8989",
    selectedFill: "#81DAE3",
    sampledFill: "#81DAE3",
  }

  property nextLevelDirector: Function(Array(Games.Blocks.Record), Number) = (history: Array(Games.Blocks.Record)) {
    case Array.last(history) {
      Nothing => initialLevel
      Just(h) => 
        if h.succeed {h.level + 1} 
        else {
          let c = 
            history
            |> Array.takeEnd(3)
            |> Array.map(.level(Games.Blocks.Record))
            |> Array.uniq()
            |> Array.size()

          // decrease level if user failed 3 times in a row
          if c == 1 {Math.max(h.level - 1, initialLevel)}
          else      {h.level} 
        }
    }
  }

  property offsetRatio = 0.2
  property borderRoundRatio = 0.1
  property padx = 8

  // ------------------------------------------------------------

  state records: Array(Games.Blocks.Record) = []
  state sampled : Array(Number) = []
  state selected : Array(Number) = []
  state level : Number = 0
  
  state phase = Games.Blocks.Phases.Ready
  
  // ------------------------------------------------------------

  get size {
    case level {
      0 => 1
      1 => 3
      2 => 4
      3 => 4
      4 => 4
      5 => 5
      6 => 5
      7 => 5
      8 => 5
      9 => 6
      10 => 6
      11 => 6
      12 => 6
      13 => 7
      14 => 7
      15 => 7
      16 => 7
      17 => 7
      18 => 8
      19 => 8
      20 => 8
      => 8
    }
  }
  get cellsize {
    let minbox = Math.min(Math.min(windowWidth, windowHeight), 500) - 2 * padx
    minbox / (size * (1 + offsetRatio))
  }
  get offset { cellsize * offsetRatio }
  get radius { cellsize * borderRoundRatio }
  get len { size * size }
  get width { size * cellsize + (size - 1) * offset }
  get height { size * cellsize + (size - 1) * offset }
  get won { sampled |> Array.reduce(true, (acc: Bool, i: Number) {acc && Array.contains(selected, i)})}

  // ------------------------------------------------------------

  style cell {
    cursor: pointer;
    transition: fill 0.3s ease-out;
  }

  // ------------------------------------------------------------

  fun startGame () {
    next {selected: [],
          phase: Games.Blocks.Phases.Initial}
    
    await Timer.timeout(0.4 * stdDelay)

    next { level : nextLevelDirector(records) }
    
    await Timer.timeout(0.6 * stdDelay)

    next {sampled: Random.shuffleIndex(len) |> Array.takeStart(level),
          phase:   Games.Blocks.Phases.Prepare}
    
    await Timer.timeout(delay(level))

    next { phase: Games.Blocks.Phases.Select }
  }

  fun selectBox(x: Number){
    if phase == Games.Blocks.Phases.Ready {startGame()}
    else if phase == Games.Blocks.Phases.Select  {
      // select only if not selected already
      if !Array.contains(selected, x) {
        next {selected: Array.push(selected, x)}

        // if selected a wrong cell or reached the end
        if !Array.contains(sampled, x) || Array.size(selected) >= Array.size(sampled) { // end of the game
          next {phase : Games.Blocks.Phases.Reveal}
          
          await Timer.timeout(stdDelay)
          
          next {records : Array.push(records, {level: level, succeed: won} ),
                phase : Games.Blocks.Phases.Initial }

          // start new game
          startGame()
        }
      }      
    }
  }

  // ------------------------------------------------------------

  fun render {
    <>

      <h2 class="container my-4 text-center">
        if phase == Games.Blocks.Phases.Ready {
          :ready
        }
        else {
          "#{:level}: #{level}"
        }
      </h2>

      <div class="d-flex justify-content-center">
        <svg 
          width="#{width}" 
          height="#{height}" 
          xmlns="http://www.w3.org/2000/svg">

        for x of Array.range(0, len-1) {
            <rect::cell
              x="#{(x % size)*(offset + cellsize)}" 
              y="#{Math.floor(x / size)*(offset + cellsize)}" 
              width="#{cellsize}" 
              height="#{cellsize}"
              rx="#{radius}" 
              ry="#{radius}" 
              fill={ 
                case phase {
                  Games.Blocks.Phases.Ready => theme.inactiveFill
                  Games.Blocks.Phases.Initial => theme.inactiveFill
                  Games.Blocks.Phases.Prepare => if Array.contains(sampled, x) {theme.sampledFill} else {theme.inactiveFill}
                  Games.Blocks.Phases.Select => if Array.contains(selected, x) {theme.selectedFill} else {theme.inactiveFill}
                  Games.Blocks.Phases.Reveal => case [Array.contains(sampled, x), Array.contains(selected, x)] {
                    [true, true] => theme.correctFill
                    [true, false] => theme.missedFill
                    [false, true] => theme.wrongFill
                     => theme.inactiveFill
                  }
                } 
              }

              onClick={ () {selectBox(x)} }
              />
          }
        </svg>
      </div>
    </>
  }
}
