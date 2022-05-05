test_that("multiplication works", {
  expect_equal(remover_tildes("ÿúòâ"), "yuoa")
})
