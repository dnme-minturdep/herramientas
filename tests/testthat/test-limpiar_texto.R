test_that("limpiar texto", {
  expect_equal(limpiar_texto("TéxTÔ con una Ñ?!"), "texto con una n")
  expect_equal(limpiar_texto("TéxTÔ con una Ñ?!", enie = F), "texto con una ñ")
})
