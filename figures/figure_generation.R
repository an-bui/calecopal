## examples
# get vector of palette names
all_palettes <- names(cal_palettes)

print_this <- list()
for(i in 1:length(all_palettes)) {
  this_palette <- all_palettes[i]

  print_this[[i]] <- cal_palette(this_palette)
}

par(mfrow=c(9, 5))
print_this
