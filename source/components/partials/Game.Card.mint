component Game.Card {
  property name : String
  property link : String
  property desc : String
  property img : String

  style poster {
    max-height: 200px;
  }

  fun render {
    <a href={link} class="card w-100 text-decoration-none bg-light">
      <div class="card-img-top text-center bg-white">
        <img::poster src={img} alt={name}/>
      </div>
      <div class="card-body">
        <h5 class="card-title">
          name
        </h5>
        <p class="card-text">
          desc
        </p>
      </div>
    </a>
  }
}
