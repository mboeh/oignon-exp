lapis = require "lapis"

lapis.serve class extends lapis.Application
  [index: "/"]: =>
    "Hello World!"
