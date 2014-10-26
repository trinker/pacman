context("Checking p_base")

test_that("p_base includes base packages",{
    expect_that(p_base(base.only = FALSE, basemarker = "***"), prints_text("base\\*\\*\\*"))
    expect_that(p_base(base.only = FALSE, basemarker = "*joke*"), prints_text("base\\*joke\\*"))
})