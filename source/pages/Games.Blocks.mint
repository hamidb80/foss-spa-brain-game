type Games.Blocks.Phases {
  Initial
  Prepare
  Select
  Reveal
}

type Games.Blocks.Flow {
  Stopped
  Running
}

type Games.Blocks.Record {
  level: Number,
  succeed: Bool
}

component Games.Blocks {
  connect Application exposing { windowWidth, windowHeight }

  property initialLevel = 3
  property stdDelay: Number = 1000

  property delay: Function(Number, Number) = (n: Number) {
    stdDelay + 200 * n
  }

  property inactiveFill : String = "#eaeaea"
  property correctFill : String = "#81DAE3"
  property missedFill : String = "#888"
  property wrongFill : String = "#FF8989"
  property selectedFill : String = "#81DAE3"
  property sampledFill : String = "#81DAE3"

  property nextCapacityDecider: Function(Array(Games.Blocks.Record), Number) = (history: Array(Games.Blocks.Record)) {
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
          if c == 1 {Math.max(c - 1, initialLevel)}
          else      {h.level} 
        }
    }
  }
  property sizeCalc: Function(Number, Number, Number) = (cap: Number, size: Number) {
    let inc = if cap > (size * size / 3) {1} else {0}
    size + inc
  }

  property offsetRatio = 0.2
  property borderRoundRatio = 0.1

  // ------------------------------------------------------------

  state records: Array(Games.Blocks.Record) = []
  state sampled : Array(Number) = []
  state selected : Array(Number) = []
  state level : Number = 2
  
  state phase = Games.Blocks.Phases.Initial
  state flow = Games.Blocks.Flow.Stopped
  state size : Number = 4
  

  get cellsize {
    let minbox = Math.min(Math.min(windowWidth, windowHeight), 500) - 16
    minbox / (size * (1 + offsetRatio))
  }
  get offset { cellsize * offsetRatio }
  get radius { cellsize * borderRoundRatio }

  get won { sampled |> Array.reduce(true, (acc: Bool, i: Number) {acc && Array.contains(selected, i)})}
  get len { size * size }
  get width { 
    size * cellsize + (size - 1) * offset
  }
  get height { size * cellsize + (size - 1) * offset }

  style cell {
    cursor: pointer;
    transition: fill 0.3s ease-out;
  }

  fun render : Html {
    <div>

      <h2 class="container my-4 text-center">
        if flow == Games.Blocks.Flow.Stopped {
          "Click on grid to start"
        }
        else {
          "level: #{level}"
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
                  Games.Blocks.Phases.Initial => inactiveFill
                  Games.Blocks.Phases.Prepare => if Array.contains(sampled, x) {sampledFill} else {inactiveFill}
                  Games.Blocks.Phases.Select => if Array.contains(selected, x) {selectedFill} else {inactiveFill}
                  Games.Blocks.Phases.Reveal => case [Array.contains(sampled, x), Array.contains(selected, x)] {
                    [true, true] => correctFill
                    [true, false] => missedFill
                    [false, true] => wrongFill
                     => inactiveFill
                  }
                } 
              }

              onClick={ () {selectBox(x)} }
              />
          }
        </svg>

      </div>
 
    </div>
  }

  fun startGame () {
    next {selected: [],
          level : nextCapacityDecider(records),
          flow: Games.Blocks.Flow.Running,
          phase: Games.Blocks.Phases.Initial}
    
    await Timer.timeout(0.4 * stdDelay)

    next {size: sizeCalc(level, size)}
    
    await Timer.timeout(0.6 * stdDelay)

    next {sampled: Random.shuffleIndex(len) |> Array.takeStart(level),
          phase:   Games.Blocks.Phases.Prepare}
    
    await Timer.timeout(delay(level))

    next { phase: Games.Blocks.Phases.Select }
  }

  fun selectBox(x: Number){
    if flow == Games.Blocks.Flow.Stopped {
      startGame()
    }
    else if phase == Games.Blocks.Phases.Select {
      if !Array.contains(selected, x){ // select only if not selected already
        next {selected: Array.push(selected, x)}

        if !Array.contains(sampled, x) || Array.size(selected) >= Array.size(sampled) { // end of the game
          next {phase : Games.Blocks.Phases.Reveal}
          
          await Timer.timeout(stdDelay)
          
          next {records : Array.push(records, {level: level, succeed: won} ),
                phase : Games.Blocks.Phases.Initial }

          startGame()
        }
      }      
    }
  }
}
