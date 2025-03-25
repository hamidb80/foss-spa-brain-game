type Phases {
  Initial
  Prepare
  Select
  Reveal
}

component Games.Blocks {

  property width : Number = 400
  property height : Number = 400
  
  property rows : Number = 4
  property cols : Number = 4
  property size : Number = 64
  property radius : Number = 4
  property offset : Number = 16
  property padx : Number = 16
  property pady : Number = 16

  property bgFill : String = "transparent"
  property inactiveFill : String = "#eaeaea"
  property correctFill : String = "#81DAE3"
  property missedFill : String = "#888"
  property wrongFill : String = "#FF8989"
  property selectedFill : String = "#81DAE3"
  property sampledFill : String = "#81DAE3"

  state capacity : Number = 3
  state sampled : Array(Number) = []
  state selected : Array(Number) = []

  property delay: Function(Number, Number) = (n: Number) {2000}
  state phase = Phases.Initial

  get len {
    rows*cols
  }

  style cell {
    cursor: pointer;
    transition: all 0.3s ease-out;
  }

  fun render : Html {
    <div>

      <svg 
          width="#{width}" 
          height="#{height}" 
          xmlns="http://www.w3.org/2000/svg">

        <rect 
          x="0" 
          y="0" 
          width="#{width}" 
          height="#{height}"
          fill={bgFill}
          />

        for x of Array.range(0, len-1) {
            <rect::cell
              x="#{padx+(x % cols)*(offset + size)}" 
              y="#{pady+Math.floor(x / cols)*(offset + size)}" 
              width="#{size}" 
              height="#{size}"
              rx="#{radius}" 
              ry="#{radius}" 
              fill={ 
                inactiveFill
                sampledFill
                
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

      <div>
        <button class="btn btn-primary" onClick={startGame} >
          "Start"
        </button>
      </div>

    </div>
  }

  fun startGame (event : Html.Event) {
    next { 
      selected: [],
      sampled: Random.shuffleIndex(len) |> Array.takeStart(capacity),
      phase:   Phases.Prepare}
    
    await Timer.timeout(delay(capacity))
    
    next { phase: Phases.Select }
  }

  fun selectBox(x: Number){
    next {selected: Array.push(selected, x)}

    if (Array.size(selected) == Array.size(sampled)){
      next {phase : Phases.Reveal}
    }
  }
}
