test_that("numeros en palabras", {
  expect_equal(numeros_en_palabras("25 de mayo"), "veinticinco de mayo")
  expect_equal(numeros_en_palabras("6 de abril del 98"), "seis de abril del noventa y ocho")
})
