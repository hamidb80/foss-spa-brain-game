type Phases {
  Initial
  Prepare
  Select
  Reveal
}

type Flow {
  Stopped
  Running
}

type Record {
  capacity: Number,
  succeed: Bool
}

component Games.Blocks {
  connect Application exposing { windowWidth, windowHeight }

  property initialCapacity = 3
  property stdDelay: Number = 1000

  property delay: Function(Number, Number) = (n: Number) {
    stdDelay + 200 * n
  }

  property bgFill : String = "transparent"
  property inactiveFill : String = "#eaeaea"
  property correctFill : String = "#81DAE3"
  property missedFill : String = "#888"
  property wrongFill : String = "#FF8989"
  property selectedFill : String = "#81DAE3"
  property sampledFill : String = "#81DAE3"

  property nextCapacityDecider: Function(Array(Record), Number) = (history: Array(Record)) {
    case Array.last(history) {
      Nothing => initialCapacity
      Just(h) => if h.succeed {h.capacity + 1} else {h.capacity}
    }
  }
  property sizeCalc: Function(Number, Number, Number) = (cap: Number, size: Number) {
    let inc = if cap > (size * size / 3) {1} else {0}
    size + inc
  }

  property offsetRatio = 0.2
  property borderRoundRatio = 0.1

  // ------------------------------------------------------------

  state records: Array(Record) = []
  state sampled : Array(Number) = []
  state selected : Array(Number) = []
  state capacity : Number = 2
  
  state phase = Phases.Initial
  state flow = Flow.Stopped
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
        if flow == Flow.Stopped {
          "Click on grid to start"
        }
        else {
          "level: #{capacity}"
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
                  Phases.Initial => inactiveFill
                  Phases.Prepare => if Array.contains(sampled, x) {sampledFill} else {inactiveFill}
                  Phases.Select => if Array.contains(selected, x) {selectedFill} else {inactiveFill}
                  Phases.Reveal => case [Array.contains(sampled, x), Array.contains(selected, x)] {
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
          capacity : nextCapacityDecider(records),
          flow: Flow.Running,
          phase: Phases.Initial}
    
    await Timer.timeout(0.4 * stdDelay)

    next {size: sizeCalc(capacity, size)}
    
    await Timer.timeout(0.6 * stdDelay)

    next {sampled: Random.shuffleIndex(len) |> Array.takeStart(capacity),
          phase:   Phases.Prepare}
    
    await Timer.timeout(delay(capacity))

    next { phase: Phases.Select }
  }

  fun selectBox(x: Number){
    if flow == Flow.Stopped {
      startGame()
    }
    else if phase == Phases.Select {
      if !Array.contains(selected, x){ // select only if not selected already
        next {selected: Array.push(selected, x)}

        if !Array.contains(sampled, x) || Array.size(selected) >= Array.size(sampled) { // end of the game
          next {phase : Phases.Reveal}
          
          await Timer.timeout(stdDelay)
          
          next {records : Array.push(records, {capacity: capacity, succeed: won} ),
                phase : Phases.Initial }

          startGame()
        }
      }      
    }
  }
}
