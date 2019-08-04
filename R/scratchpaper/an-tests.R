#### libraries ####
library(tidyverse)

#### functions for figures ####
five <- function(color_palette) {
  ggplot(chickwts %>%
           group_by(feed) %>%
           summarize(av = mean(weight),
                     total = length(weight)) %>%
           filter(feed != "casein"),
         aes(x = feed, y = av, fill = feed)) +
    geom_col() +
    scale_fill_manual(values = color_palette) +
    theme_bw()
}

six <- function(color_palette) {
  ggplot(chickwts, aes(x = feed, y = weight, fill = feed)) +
    geom_boxplot() +
    scale_fill_manual(values = color_palette) +
    theme_bw()
}

six_j <- function(color_palette) {
  ggplot(chickwts, aes(x = feed, y = weight, color = feed)) +
    geom_jitter(aes(color = feed), alpha = 0.8, width = 0.3, size = 2) +
    geom_boxplot(alpha = 0.2) +
    scale_color_manual(values = color_palette) +
    theme_bw()
}

#### alpine ####
sierra1 <- c("#BD973D", "#3B7D6E", "#5F5C29", "#262E43", "#4D5B75", "#5792CC")

six(sierra1)

six_j(sierra1)

sierra2 <- c("#4CA2B0", "#FDD989", "#516238", "#5A8B92", "#395B5F")

five(sierra2)

#### chaparral ####
chaparral1 <- c("#DCC27A", "#B0B9BE", "#63605F", "#985E5C", "#AEBFA8", "#F19B34")

six(chaparral1)

six_j(chaparral1)

chaparral2 <- c("#D9E4DC", "#A7C2CD", "#DEE6AD", "#D98A63", "#9A9B5F")

five(chaparral2)

#### oak woodland ####
oak1 <- c("#EFC68E", "#B58755", "#7C9867", "#4F5730","#7A5028")

five(oak1)

oak2 <- c("#ACB870", "#59672A", "#D7D3DA", "#665543", "#262722")

five(oak2)

#### conifer forest ####
conifer <- c("#CC7540", "#765043", "#A69260", "#979A6B", "#9A9657")

five(conifer)

#### wildflower ####
flowers1 <- c("#ECAB99", "#F1C100", "#9484B1", "#5B6530", "#B9C7E2")

five(flowers1)

flowers2 <- c("#DE7424", "#F5CA37", "#AD8D26", "#496849", "#654783")

five(flowers2)

flowers3 <- c("#E69512", "#D3105C", "#3B4F8E", "#3A5D3D", "#4C4976", "#6C91BD")

six(flowers3)

#### wildfire ####
fire <- c("#B77B7B", "#FEEC44", "#F66C09", "#E60505", "#2C1B21")

five(fire)

#### kelp forest ####
kelp1 <- c("#114C54", "#009BB0", "#54662C", "#BE8333", "#FFBF00","#C70000")

six(kelp1)
six_j(kelp1)

kelp2 <- c("#6D5A18", "#3D6334", "#368000", "#026779", "#0FB2D3")

five(kelp2)

# minor changes
