test_that("apikeys return good keys", {
   apikeys <- c("administratif",
      "adresse",
      "agriculture",
      "altimetrie",
      "cartes",
      "cartovecto",
      "clc",
      "economie",
      "enr",
      "environnement",
      "geodesie",
      "lambert93",
      "ocsge",
      "ortho",
      "orthohisto",
      "parcellaire",
      "satellite",
      "sol",
      "topographie",
      "transports"
   )
  expect_equal(get_apikeys(), apikeys)
  expect_equal(length(get_apikeys()), 20)
})
