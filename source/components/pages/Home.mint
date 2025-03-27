locale en {
  games: "Games",
  howtoplay: "Click to Play",
  misson: "the misson of this project is to provide free and open-source brain games, in a way that is customizable and easily self-hostable",
}

component Home {
  property projectlink = "https://github.com/hamidb80/foss-spa-brain-games"

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
              @svg(/assets/brain-puzzled.svg)
            </div>
          </div>
          <div class="text-center mt-2 text-wrap mx-2">
            :misson
          </div>

          <div class="text-center mt-2">
            <a class="btn btn-outline-dark" href={projectlink}>
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

      <div class="row mx-lg-5 mx-3 my-4">
        
        <div class="col-12 col-lg-4 gx-4 gy-3">
          <Game.Card
            link="/games/blocks"
            name="Memory Block"
            img={@asset(/assets/memory-blocks.png)}
            desc="choose those blocks that you've seen few seconds ago"
            />
        </div>

        <div class="col-12 col-lg-4 gx-4 gy-3">
          <Game.Card
            link="/games/shape-color"
            name="Shape Color"
            img={@asset(/assets/shape-color.png)}
            desc="is the color name same as color of the shape?"
            />
        </div>

        <div class="col-12 col-lg-4 gx-4 gy-3">
          <Game.Card
            link="/games/like-previous-shape"
            name="Like Previous?"
            img={@asset(/assets/like-previous.png)}
            desc="is the shape same as previous shape?"
            />
        </div>

      </div>
        
    </div>
  }
}
