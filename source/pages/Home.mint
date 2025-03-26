locale en {
  games: "Games",
  howtoplay: "Click to Play",
  misson: "the misson of this project is to provide free and open-source brain games, in a way that is customizable and easily self-hostable",
}

component Home {
  style logo {
    width: 100px;
    height: 100px;

    *{
      max-width: 100%;
      max-height: 100%;
    }
  }

  fun render {
    <div>
      <div class="container">

        <div class="my-3">
          <div class="d-flex justify-content-center">
            <div::logo>
              @svg(../../assets/brain-puzzled.svg)
            </div>
          </div>
          <div class="text-center mt-2">
            :misson
          </div>

          <div class="text-center mt-2">
            <a class="btn btn-outline-dark" href="https://github.com/hamidb80/foss-spa-brain-games">
              <i class="bi bi-github"></i>
            </a>
          </div>
        </div>

        <h1 class="text-center mt-5">
          :games
          <i class="bi bi-joystick mx-3"></i>
        </h1>

        <h4 class="text-center text-muted">
          <i class="bi bi-hand-index mx-2"></i>
          :howtoplay
        </h4>
      </div>

      <div class="row px-5 my-4">
        
        <div class="col-12 col-lg-4 gx-2">
          <Game.Card
            link="/games/blocks"
            name="Memory Block"
            img={@asset(../../assets/memory-blocks.png)}
            desc="choose those blocks that you've seen few seconds ago"
            />
        </div>

      </div>
        
    </div>
  }
}
