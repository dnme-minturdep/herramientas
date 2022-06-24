test_that("remover tildes", {
  expect_equal(remover_tildes("ÿúòâ"), "yuoa")
})
