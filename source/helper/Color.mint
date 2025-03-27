type NamedColor {
  name: String,
  code: String,
}

module Colors {
  const DEFAULTS = [
    {name: "red" , code: "#FF2929"},
    {name: "blue" , code: "#387ADF"},
    {name: "brown" , code: "#A66E38"},
    {name: "green" , code: "#77B254"},
    {name: "pink" , code: "#ED3EF7"},
    {name: "yellow" , code: "#FFB22C"},
    {name: "black" , code: "#313131"},
  ] 

  const EMPTY = {name: "" , code: ""}
}