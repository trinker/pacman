context("Checking p_extract")


test_that("p_extract breaks a string into correct number of elements",{

	Depends <- paste0(" R (>= 3.1.0), ggplot2 (>= 0.9.3.1), qdapDictionaries ", 
        "(>= 1.0.2), qdapRegex (>= 0.1.2), qdapTools (>= 1.0.1), RColorBrewer")

    expect_true(length(p_extract(Depends)) == 6)
})

test_that("p_extract removes parenthesis",{

	Depends <- paste0(" R (>= 3.1.0), ggplot2 (>= 0.9.3.1), qdapDictionaries ", 
        "(>= 1.0.2), qdapRegex (>= 0.1.2), qdapTools (>= 1.0.1), RColorBrewer")

    expect_false(any(grepl("\\(|\\)", p_extract(Depends))))
})


test_that("p_extract does not have leading/trailing spaces in output",{

	Depends <- paste0(" R (>= 3.1.0), ggplot2 (>= 0.9.3.1), qdapDictionaries ", 
        "(>= 1.0.2), qdapRegex (>= 0.1.2), qdapTools (>= 1.0.1), RColorBrewer")

    expect_false(any(grepl("^\\s+|\\s+$", p_extract(Depends))))

})


test_that("p_extract does not have leading/trailing spaces in names of output",{

	Depends <- paste0(" R (>= 3.1.0), ggplot2 (>= 0.9.3.1), qdapDictionaries ", 
        "(>= 1.0.2), qdapRegex (>= 0.1.2), qdapTools (>= 1.0.1), RColorBrewer")

    expect_false(any(grepl("^\\s+|\\s+$", names(p_extract(Depends)))))
	
})