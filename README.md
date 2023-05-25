# calecopal: a California-inspired package of color palettes.

Code from Karthik Ram's `wesanderson` package, linked [here](https://github.com/karthik/wesanderson). Palettes compiled by A. Bui, H. Lowman, and A.S. Guerra. Pictures were taken from image search/personal collections, and colors were generated using [Canva](https://www.canva.com/colors/color-palette-generator/) and [imagecolorpicker](https://imagecolorpicker.com/).

## Installation

```
devtools::install_github("an-bui/calecopal")
```

## Updates
**September 2020**: 23 new palettes!
![ ](/figures/all-palettes-2020-09.png)

### Redwoods

![ ](/figures/redwood_pic.png)

### Organisms!

#### Calochortus catalinae

<p align="center">
  <img src="/figures/calochortus_pic.png" height="50%">
</p>

## Usage

```
library(calecopal)

# all palettes
names(cal_palettes)
```

## Palettes
More coming soon!

### Chaparral

![ ](/figures/chaparral_pal.png)

### Superbloom

![ ](/figures/superbloom_pal.png)

### Big Sur

![ ](/figures/bigsur_pal.png)

## Building palettes

You can use the `cal_palette()` function to create your own palettes to fit your needs. For example:

```
cal_palette(name = "desert", n = 15, type = "continuous")
```

<p align="center">
  <img src="/figures/desert_pal.jpeg" height="40%">
</p>

```
cal_palette("sierra1", n = 50, type = "continuous")
```

<p align="center">
  <img src="/figures/sierra1_pal.jpeg" height="40%">
</p>

## Example plots

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

<p align="center">
  <img src="/figures/sierra1_example.jpeg">
</p>

```
ggplot(chickwts, aes(x = feed, y = weight, color = feed)) +
    geom_jitter(aes(color = feed), alpha = 0.8, width = 0.3, size = 2) +
    geom_boxplot(alpha = 0.2) +
    scale_color_manual(values = cal_palette("kelp1")) +
    theme_bw()
```

<p align="center">
  <img src="/figures/kelp1_plot.jpeg">
</p>

## As seen in

### `superbloom3`: Miles et al. Ecosphere 2022.

Miles et al. _Ecosphere_ 2022. "Effects of urbanization on specialist insect communities of milkweed are mediated by spatial and temporal variation." [https://doi.org/10.1002/ecs2.4222](https://doi.org/10.1002/ecs2.4222).

<p align="center">
  <img src="/figures/miles-ecosphere.jpeg", height = "10%">
</p>

### `kelp1`: Miller-ter Kuile et al. _Ecology_ 2022. 

"Predator–prey interactions of terrestrial invertebrates are determined by predator body size and species identity." [https://doi.org/10.1002/ecy.3634](https://doi.org/10.1002/ecy.3634).

<p align="center">
  <img src="/figures/miller-ter-kuile-ecology.jpeg", height = "10%">
</p>

### `chaparral1`: Orr et al. _Rangeland Ecology and Management_ 2022.

Orr et al. _Rangeland Ecology and Management_ 2022. "Grazing Intensity Effects on Fire Ignition Risk and Spread in Sagebrush Steppe." [https://doi.org/10.1016/j.rama.2022.08.004](https://doi.org/10.1016/j.rama.2022.08.004).

<p align="center">
  <img src="/figures/orr-rem.jpg", height = "10%">
</p>

### `superbloom1`: Apigo and Oono. _Ecosphere_ 2022.

Apigo and Oono. _Ecosphere_ 2022. "Plant abundance, but not plant evolutionary history, shapes patterns of host specificity in foliar fungal endophytes." [https://doi.org/10.1002/ecs2.3879](https://doi.org/10.1002/ecs2.3879).

<p align="center">
  <img src="/figures/apigo-ecosphere.jpg", height = "10%">
</p>


