#' Complete list of palettes
#'
#' Use \code{\link{cal_palette}} to construct palettes of desired length.
#'
#' @export
cal_palettes <- list(
  sierra1 = c("#BD973D", "#5F5C29", "#3B7D6E", "#5792CC", "#4D5B75", "#262E43"),
  sierra2 = c("#FDD989", "#8BAD57", "#516238", "#4CA2B0", "#5A8B92", "#395B5F"),
  chaparral1 = c("#DCC27A", "#B0B9BE", "#63605F", "#985E5C", "#AEBFA8", "#F19B34"),
  chaparral2 = c("#D98A63", "#D9E4DC", "#C5D2D2", "#79B38F", "#9A9B5F", "#A7C2CD"),
  chaparral3 = c("#D3E3CA", "#BED6B3", "#92A587", "#4A5438", "#2F3525"),
  conifer = c("#CC7540", "#765043", "#A69260", "#979A6B", "#39692F"),
  desert = c("#F6EECF", "#ECD6AB", "#B09175", "#632D1F", "#291611"),
  wetland = c("#DED4C8", "#AD6F4F", "#AEC96F", "#2B3851", "#3F320D"),
  oak = c("#EFC68E", "#B58755", "#7C9867", "#4F5730","#7A5028"),
  kelp1 = c("#C70000", "#FFBF00", "#BE8333", "#54662C", "#009BB0", "#114C54"),
  kelp2 = c("#0FB2D3", "#026779", "#368000", "#3D6334", "#6D5A18"),
  coastaldune1 = c("#DCC8BA", "#DCD6C5", "#B4AA98", "#D7DCE4", "#444239"),
  coastaldune2 = c("#E2D78A", "#E4B3E2", "#90816E", "#523833", "#372E21"),
  superbloom1 = c("#B9C7E2", "#ECAB99", "#F1C100",  "#5B6530", "#9484B1"),
  superbloom2 = c("#DE7424", "#F5CA37", "#AD8D26", "#496849", "#654783"),
  superbloom3 = c("#E69512", "#D3105C", "#3B4F8E", "#3A5D3D", "#4C4976", "#6C91BD"),
  sbchannel = c("#A1CAF6", "#6592D6", "#4C6FA1", "#375377", "#1E2F46"),
  lake = c("#CECEB9", "#7AC9B7", "#6CA184", "#3793EC", "#2A3927"),
  fire = c("#B77B7B", "#FEEC44", "#F66C09", "#E60505", "#2C1B21"),
  agriculture = c("#A45C44", "#5A7F3C", "#CACA91", "#2C3B26", "#88B063"),
  bigsur = c("#E4DECE", "#ECBD95", "#9BB1BB", "#79ACBD", "#346575", "#0B4221"),
  figmtn = c("#E29244", "#D46F10", "#D83504", "#69B9FA", "#4B8FF7", "#6B6D9F")
)

#' A California ecosystem color palette generator
#'
#' These are a couple handfuls of color palettes inspired by California ecosystems.
#'
#' @param n Number of colors desired. If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{sierra1}, \code{sierra2},  \code{chaparral1}, \code{chaparral2}, \code{chaparral3},  \code{conifer}, \code{desert}, \code{wetland}, \code{oak1}, \code{oak2}, \code{kelp1}, \code{kelp2}, \code{coastaldune1}, \code{coastaldune2}, \code{superbloom1}, \code{superbloom2}, \code{superbloom3}, \code{sbchannel}, \code{lake}, \code{fire}, \code{agriculture}, \code{bigsur}, \code{figmtn}
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
#' pal <- cal_palette(name = "coastaldune1", n = 21, type = "continuous")
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
