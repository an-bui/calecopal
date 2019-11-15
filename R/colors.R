#' Complete list of palettes
#'
#' Use \code{\link{cal_palette}} to construct palettes of desired length.
#'
#' @export
cal_palettes <- list(
  sierra1 = c("#BD973D", "#3B7D6E", "#5F5C29", "#262E43", "#4D5B75", "#5792CC"),
  sierra2 = c("#4CA2B0", "#FDD989", "#516238", "#5A8B92", "#395B5F"),
  chaparral1 = c("#DCC27A", "#B0B9BE", "#63605F", "#985E5C", "#AEBFA8", "#F19B34"),
  chaparral2 = c("#9A9B5F", "#D9E4DC", "#D98A63", "#A7C2CD", "#C5D2D2"),
  chaparral3 = c("#D3E3CA", "#BED6B3", "#92A587", "#2F3525", "#4A5438"),
  conifer = c("#CC7540", "#765043", "#A69260", "#979A6B", "#9A9657"),
  desert = c("#F6EECF", "#ECD6AB", "#B09175", "#632D1F", "#291611"),
  wetland = c("#3F320D", "#AD6F4F", "#DED4C8", "#2B3851", "#AEC96F"),
  oak1 = c("#EFC68E", "#B58755", "#7C9867", "#4F5730","#7A5028"),
  oak2 = c("#ACB870", "#59672A", "#D7D3DA", "#665543", "#262722"),
  kelp1 = c("#114C54", "#009BB0", "#54662C", "#BE8333", "#FFBF00","#C70000"),
  kelp2 = c("#6D5A18", "#3D6334", "#368000", "#026779", "#0FB2D3"),
  coastaldune1 = c("#DCC8BA", "#DCD6C5", "#B4AA98", "#D7DCE4", "#444239"),
  coastaldune2 = c("#E2D78A", "#E4B3E2", "#372E21", "#90816E", "#523833"),
  superbloom1 = c("#ECAB99", "#F1C100", "#9484B1", "#5B6530", "#B9C7E2"),
  superbloom2 = c("#DE7424", "#F5CA37", "#AD8D26", "#496849", "#654783"),
  superbloom3 = c("#E69512", "#D3105C", "#3B4F8E", "#3A5D3D", "#4C4976", "#6C91BD"),
  sbchannel = c("#A1CAF6", "#6592D6", "#4C6FA1", "#375377", "#1E2F46"),
  lake = c("#3793EC", "#7AC9B7", "#CECEB9", "#2A3927", "#6CA184"),
  fire = c("#B77B7B", "#FEEC44", "#F66C09", "#E60505", "#2C1B21"),
  agriculture = c("#A45C44", "#5A7F3C", "#CACA91", "#2C3B26", "#88B063")
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
#' cal_palette("chaparral1")
#' cal_palette("chaparral2")
#' cal_palette("chaparral3")
#' cal_palette("coastaldune1", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- cal_palette(21, name = "coastaldune1", type = "continuous")
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
