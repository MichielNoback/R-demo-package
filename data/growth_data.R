
create_demo_data <- function() {
    time_mins <- c(0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160)
    OD600_A1 <- c(0.023, 0.035, 0.059, 0.099, 0.167, 0.256, 0.349, 0.491, 0.684, 0.821, 0.916)
    OD600_A2 <- c(0.022, 0.031, 0.062, 0.103, 0.174, 0.263, 0.358, 0.508, 0.691, 0.826, 0.927)

    OD600_B1 <- c(0.023, 0.022, 0.027, 0.051, 0.074, 0.099, 0.123, 0.178, 0.263, 0.341, 0.382)
    OD600_B2 <- c(0.018, 0.019, 0.024, 0.047, 0.067, 0.085, 0.109, 0.165, 0.243, 0.308, 0.342)

    data <- data.frame(minutes = time_mins,
                       OD600_control_A = OD600_A1,
                       OD600_control_B = OD600_A2,
                       OD600_agentX_A = OD600_B1,
                       OD600_agentX_B = OD600_B2)

    growth_data <- tidyr::pivot_longer(data = data,
                       cols = 2:5,
                       names_to = c("condition", "duplo"),
                       names_pattern = "OD600_(control|agentX)_(A|B)",
                       values_to = "OD600")

    usethis::use_data(growth_data, overwrite=TRUE)
}

create_demo_data()


