#### libraries ####
library(tidyverse)

#### alpine ####
sierra1 <- c("#BD973D", "#3B7D6E", "#5F5C29", "#262E43", "#4D5B75", "#5792CC")

ggplot(chickwts, aes(x = feed, y = weight, fill = feed)) +
  geom_boxplot() +
  scale_fill_manual(values = alpine) +
  theme_bw()

sierra2 <- c("#4CA2B0", "#FDD989", "#516238", "#5A8B92", "#395B5F")

chickwts_s <- chickwts %>%
  group_by(feed) %>%
  summarize(av = mean(weight),
            total = length(weight)) %>%
  filter(feed != "casein")

ggplot(chickwts_s, aes(x = feed, y = av, fill = sierra2)) +
         geom_col() +
  scale_fill_manual(values = sierra2) +
  theme_bw()

#### chaparral ####
chaparral1 <- c("#DCC27A", "#B0B9BE", "#63605F", "#985E5C", "#AEBFA8", "#F19B34")

ggplot(chickwts, aes(x = feed, y = weight, fill = feed)) +
  geom_boxplot() +
  scale_fill_manual(values = chaparral1) +
  theme_bw()

chaparral2 <- c("#9A9B5F", "#D9E4DC", "#D98A63", "#A7C2CD", "#C5D2D2")

ggplot(chickwts_s, aes(x = feed, y = av, fill = feed)) +
  geom_col() +
  scale_fill_manual(values = chaparral2) +
  theme_bw()
