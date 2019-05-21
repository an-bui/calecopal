#' Complete list of palettes
#'
#' Use \code{\link{wes_palette}} to construct palettes of desired length.
#'
#' @export
cal_palettes <- list(
  name_1 = c("#A42820", "#5F5647", "#9B110E", "#3F5151", "#4E2A1E", "#550307", "#0C1707"),
  name_2 = c("#FAD510", "#CB2314", "#273046", "#354823", "#1E1E1E"),
  name_3 = c("#E1BD6D", "#EABE94", "#0B775E", "#35274A" ,"#F2300F"),
  name_4 = c("#E1BD6D", "#EABE94", "#0B775E", "#35274A" ,"#F2300F"),
  name_5 = c("#899DA4", "#C93312", "#FAEFD1", "#DC863B"),
  name_6 = c("#9A8822", "#F5CDB4", "#F8AFA8", "#FDDDA0", "#74A089"),
  name_7 = c("#3B9AB2", "#78B7C5", "#EBCC2A", "#E1AF00", "#F21A00")
)

#' A California ecosystem color palette generator
#'
#' These are a handful of color palettes inspired by California ecosystems.
#'
#' @param n Number of colors desired. Unfortunately most palettes now only
#'   have 4 or 5 colors. But hopefully we'll add more palettes soon. All color
#'   schemes are derived from the most excellent Tumblr blog:
#'   \href{http://wesandersonpalettes.tumblr.com/}{Wes Anderson Palettes}.
#'   If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{name_1}, \code{name_2},  \code{name_3},
#'   \code{name_4}, \code{name_5},  \code{name_6}, \code{name_7}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' cal_palette("name_1")
#' cal_palette("name_2")
#' cal_palette("name_3")
#' cal_palette("name_4", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- cal_palette(21, name = "name_1", type = "continuous")
#' image(volcano, col = pal)
#'

# name a wes_palette function, where there are 3 argument names: name, n, and type
cal_palette <- function(name, n, type = c("discrete", "continuous")) {

  # designate type as matching either argument in c("discrete", "continuous")
  type <- match.arg(type)

  # pal is palette function subsetting by name
  pal <- cal_palettes[[name]]
  # if input doesn't equal any names in pal, give error message
  if (is.null(pal))
    stop("Palette not found.")

  # no stop statement to this if?
  if (missing(n)) {
    n <- length(pal)
  }

  # if the type is discrete and n is greater than the length of the pallete, give error message
  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  # select one of a list of alternatives - idk what this does
  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb

# print.palette is a function that will list all palettes in the package
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}

#' heatmap
#'
#' A heatmap example
