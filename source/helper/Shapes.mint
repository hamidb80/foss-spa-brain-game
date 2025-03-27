module ShapeGenerator {
  fun square (scale: Number) {
    let s = scale
    "m #{s} 0 L #{s} #{s} L 0 #{s} L 0 0 L #{s} 0"
  }

  fun triangle (scale: Number) {
    let f = scale * 1.0
    let h = scale * 0.5
    "m #{h} 0 L #{f} #{f} L 0.0 #{f} L #{h} 0.0"
  }

  fun pentagon (scale: Number) {
   "M #{scale * 0.50} #{scale * 0.00}
    L #{scale * 0.95} #{scale * 0.30}
    L #{scale * 0.80} #{scale * 0.95}
    L #{scale * 0.19} #{scale * 0.95}
    L #{scale * 0.05} #{scale * 0.30}
    Z" 
  }

  fun hexagon (scale: Number) {
   "M #{scale * 0.50} #{scale * 0.00}
    L #{scale * 1.00} #{scale * 0.25}
    L #{scale * 1.00} #{scale * 0.75}
    L #{scale * 0.50} #{scale * 1.00}
    L #{scale * 0.00} #{scale * 0.75}
    L #{scale * 0.00} #{scale * 0.25}
    Z"
  }

  fun circle (scale: Number) {
    let f = scale * 1.0
    let h = scale * 0.5
    "
    M   0  #{h}
    m #{f}   0
    a #{h} #{h} 0 1 0 -#{f},0
    a #{h} #{h} 0 1 0  #{f},0
    "
  }

  fun empty (scale: Number) {
    ""
  }

  const ALL = [
    ShapeGenerator.triangle,
    ShapeGenerator.square,
    ShapeGenerator.circle,
    ShapeGenerator.pentagon,
    ShapeGenerator.hexagon,
  ]
}


