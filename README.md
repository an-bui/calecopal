# calecopal: a California-inspired package of color palettes.

Code from Karthik Ram's `wesanderson` package, linked [here](https://github.com/karthik/wesanderson). Palettes compiled by A. Bui, H. Lowman, and A.S. Guerra. Pictures were taken from image search/personal collections, and colors were generated using [Canva](https://www.canva.com/colors/color-palette-generator/) and [imagecolorpicker](https://imagecolorpicker.com/).

### Install package

```
devtools::install_github("an-bui/calecopal")
```

### Usage

```
library(calecopal)

# all palettes
names(cal_palettes)
```

### Palettes
More coming soon!

#### Chaparral

![ ](https://github.com/an-bui/calecopal/blob/master/figures/chaparral_pal.png)

#### Superbloom

![ ](https://github.com/an-bui/calecopal/blob/master/figures/superbloom_pal.png)

#### Big Sur

![ ](https://github.com/an-bui/calecopal/blob/master/figures/bigsur_pal.png)

### Building palettes

You can use the `cal_palette()` function to create your own palettes to fit your needs. For example:

```
cal_palette(name = "desert", n = 15, type = "continuous")
```

![ ](https://github.com/an-bui/calecopal/blob/master/figures/desert_pal.jpeg)

```
cal_palette("sierra1", n = 50, type = "continuous")
```

![](https://github.com/an-bui/calecopal/blob/master/figures/sierra1_pal.jpeg)

### Example plots

```
library(tidyverse)

ggplot(chickwts %>%
           group_by(feed) %>%
           summarize(av = mean(weight),
                     total = length(weight)) %>%
           filter(feed != "casein"),
         aes(x = feed, y = av, fill = feed)) +
    geom_col() +
    scale_fill_manual(values = cal_palette("sierra1")) +
    theme_bw()
```
![ ](https://github.com/an-bui/calecopal/blob/master/figures/sierra1_example.jpeg)
```
ggplot(chickwts, aes(x = feed, y = weight, color = feed)) +
    geom_jitter(aes(color = feed), alpha = 0.8, width = 0.3, size = 2) +
    geom_boxplot(alpha = 0.2) +
    scale_color_manual(values = cal_palette("kelp1")) +
    theme_bw()
```
![ ](https://github.com/an-bui/calecopal/blob/master/figures/kelp1_plot.jpeg)
