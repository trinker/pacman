context("Checking p_base")

test_that("p_base includes base packages",{
    expect_that(p_base(basemarker = "***"), prints_text("base \\*\\*\\*"))
    expect_that(p_base(basemarker = "*joke*"), prints_text("base \\*joke\\*"))
})