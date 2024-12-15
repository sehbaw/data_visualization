#install.packages('osmdata')
#install.packages('magick')
library(rayshader)
library(raster)
library(osmdata)
library(sf)
library(dplyr)
library(ggplot2)
library(magick)
hawaii = raster('Kilauea.tif')
hawaii_mat = raster_to_matrix(hawaii)

hawaii_small = resize_matrix(hawaii_mat, 0.25)
 
hawaii_small %>%
  height_shade() %>%
  #changed texture from the tutorial maybe try with desert texture
  add_overlay(sphere_shade(hawaii_small, texture='desert', zscale=4, colorintensity=5), alphalayer=0.5) %>%
  add_shadow(lamb_shade(hawaii_small, zscale=6), 0) %>%
  add_shadow(ambient_shade(hawaii_small), 0) %>%
    add_shadow(texture_shade(hawaii_small, detail=8/10, contrast=9, brightness=11), 0.1) %>%
    plot_map()


