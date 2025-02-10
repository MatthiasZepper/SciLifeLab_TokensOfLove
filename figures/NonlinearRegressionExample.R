library(ggplot2)

# Theming ########################################################

palette_scilifelab <- function() {
  c(
    "scilifelab" = "#a7c947",
    "scilifelab_green" = "#a7c947",
    "scilifelab_teal" = "#045c64",
    "scilifelab_aqua" = "#4c979f",
    "scilifelab_grape" = "#491f53",
    "scilifelab_lightgray" = "#e5e5e5",
    "scilifelab_mediumgray" = "#a6a6a6",
    "scilifelab_darkgray" = "#3f3f3f",
    "scilifelab_white" = "#ffffff"
  )
}

theme_scilifelab <- function(base_size = 15) {
  # Global colors
  fillA <- palette_scilifelab()["scilifelab_green"]
  white <- palette_scilifelab()["scilifelab_white"]
  black <- palette_scilifelab()["scilifelab_darkgray"]
  grey <- palette_scilifelab()["scilifelab_lightgray"]
  scilifelab <- palette_scilifelab()["scilifelab"]
  scilifelab_main <- palette_scilifelab()["scilifelab_darkgray"]
  scilifelab_secondary <- palette_scilifelab()["scilifelab_mediumgray"]
  # Starts with theme_grey and then modify some parts
  theme_grey(base_size = base_size) %+replace%
    
    ggplot2::theme(
      
      # Base Inherited Elements
      line = ggplot2::element_line(colour = grey, linewidth = 0.5, linetype = 1, lineend = "butt"),
      rect = ggplot2::element_rect(fill = white, colour = fillA, linewidth = 0.5, linetype = 1),
      text = ggplot2::element_text(
        family = "Linux Biolinum",
        colour = scilifelab_main, size = base_size,
        lineheight = 0.9, hjust = 0.5, vjust = 0.5, angle = 0,
        margin = ggplot2::margin(), debug = FALSE
      ),
      
      # Axes
      axis.line = ggplot2::element_blank(),
      axis.text = ggplot2::element_text(size = rel(0.8)),
      axis.ticks = ggplot2::element_line(color = grey, linewidth = rel(1 / 3)),
      axis.title = ggplot2::element_text(size = rel(1.0), face = "bold"),
      
      # Panel
      panel.background = ggplot2::element_rect(fill = white, color = NA),
      panel.border = ggplot2::element_rect(fill = NA, linewidth = rel(1 / 2), color = fillA),
      panel.grid.major = ggplot2::element_line(color = grey, linewidth = rel(1 / 5), linetype = "longdash"),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.minor.x = ggplot2::element_blank(),
      panel.spacing = ggplot2::unit(.75, "cm"),
      
      # Legend
      legend.key = ggplot2::element_rect(fill = white, color = NA),
      legend.position = "bottom",
      legend.title = element_text(face = "bold"),
      
      # Strip (Used with multiple panels)
      strip.background = ggplot2::element_rect(fill = scilifelab_main, color = fillA),
      strip.text = ggplot2::element_text(color = white, size = ggplot2::rel(0.8), margin = ggplot2::margin(t = 5, b = 5)),
      
      # Plot
      plot.title = ggplot2::element_text(
        family = "Linux Biolinum",
        color = scilifelab_main,
        face = "bold",
        size = rel(1.2), hjust = 0,
        margin = ggplot2::margin(t = 0, r = 0, b = 4, l = 0, unit = "pt")
      ),
      plot.subtitle = ggplot2::element_text(
        family = "Linux Biolinum",
        color = scilifelab_secondary,
        face = "italic",
        size = rel(0.9), hjust = 0,
        margin = ggplot2::margin(t = 0, r = 0, b = 3, l = 0, unit = "pt")
      ),
      
      # Complete theme
      complete = TRUE
    )
}

# Plotting ########################################################

# Set seed for reproducibility
set.seed(456)

# Generate random data 
# Draw x from uniform distribution
x <- sort(runif(25, min = 0, max = 10))
# Sample y from a Weibull distribution
y <- sort(rweibull(25, shape = 1.5, scale = 10)) + x * rnorm(25, mean = 0, sd = 0.5)
data <- data.frame(x, y)

# Fit non-linear models
# The script uses nls (nonlinear least squares) for the regression
model1 <- nls(y ~ a * sin(b * x) + c , data = data, start = list(a = 5, b = 1, c = 0))
model2 <- nls(y ~ a * x^2 + b * x + c, data = data, start = list(a = 0, b = 1, c = 0))
model3 <- nls(y ~ a * exp(b * x) + c, data = data, start = list(a = 1, b = 0.1, c = 0))

# Generate predictions
x_pred <- seq(0, 10, length.out = 100)
pred1 <- predict(model1, newdata = data.frame(x = x_pred))
pred2 <- predict(model2, newdata = data.frame(x = x_pred))
pred3 <- predict(model3, newdata = data.frame(x = x_pred))

# Create a dataframe for predictions
pred_data <- data.frame(
  x = rep(x_pred, 3),
  y = c(pred1, pred2, pred3),
  model = rep(c("Sinusoidal", "Quadratic", "Exponential"), each = length(x_pred))
)

# Plot results
plot <- ggplot(data, aes(x, y)) +
  geom_point(color = palette_scilifelab()["scilifelab_darkgray"], alpha = 0.6) +
  geom_line(data = pred_data, aes(x, y, color = model), linewidth = 1) +
  labs(title = "Non-linear Regression Models",
       subtitle = "Fitting different non-linear models to random data",
       x = "x", y = "y") +
  scale_color_manual("Model",values=unname(palette_scilifelab()[2:4])) +
  theme_scilifelab(11)

png(filename = "NonlinearRegression.png",
    width = 1200, height = 1200, units = "px", pointsize = 8, res = 300, bg = "white")
    print(plot)
    dev.off()