library(lubridate)
library(purrr)
start <- as.Date("2010-01-01")
end <- as.Date("2050-12-31")
dates <- seq(start, end, by = 1)

quarter_starts <- unique(floor_date(dates, unit = "quarter"))
names(quarter_starts) <- map_chr(quarter_starts, \(x) paste0(year(x), quarter(x)))
usethis::use_data(quarter_starts)

quarter_ends <- unique(ceiling_date(dates, unit = "quarter"))
quarter_ends <- quarter_ends %m-% days(1)
names(quarter_ends) <- map_chr(quarter_ends, \(x) paste0(year(x), quarter(x)))
usethis::use_data(quarter_ends)

quarters <- names(quarter_starts)
usethis::use_data(quarters)

fy_quarter_starts <- quarter_starts
names(fy_quarter_starts) <- dplyr::lead(names(fy_quarter_starts), 2)
fy_quarter_starts <- fy_quarter_starts[which(!is.na(names(fy_quarter_starts)))]
usethis::use_data(fy_quarter_starts)

fy_quarter_ends <- quarter_ends
names(fy_quarter_ends) <- dplyr::lead(names(fy_quarter_ends), 2)
fy_quarter_ends <- fy_quarter_ends[which(!is.na(names(fy_quarter_ends)))]
usethis::use_data(fy_quarter_ends)
