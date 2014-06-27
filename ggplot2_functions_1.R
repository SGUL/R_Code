# Functions to simnplify ggplot2 and deal with different versions
# Fulliautomatix: ggplot2 version "0.9.3.1"
# Version numbers: major.minor[.build[.revision]]
(this.ggplot2.source.script <- "ggplot2_functions_1.R")
cat("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%", "\n")
cat(paste("Loaded source:", this.ggplot2.source.script), "\n")
cat("Available functions:", "\n")
cat("gg_title\n")
cat("gg_format_plot_title", "\n")
cat("gg_format_axis_text_x", "\n")
cat("gg_format_axis_text_y", "\n")
cat("gg_format_axis_title_x", "\n")
cat("gg_format_axis_title_y", "\n")
cat("gg_remove_panel()", "\n")
cat("gg_remove_legend()", "\n")
cat("gg.def.fct(font.size)", "\n")
cat("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%", "\n")
(old.version <- 0.9)
(ggplot2.version <- as.character(packageVersion("ggplot2")))
(ggplot2.version.number <- as.integer(gsub("\\.", "", ggplot2.version)))

#......................................................................
# Insert in scripts:
#......................................................................
# gg.def <- gg_format_plot_title(farbe="black", druck="bold", groesse=14, vvjust=1) +
#   gg_format_axis_text_x(farbe="black", druck="bold", groesse=12) +
#   gg_format_axis_text_y(farbe="black", druck="bold", groesse=11) +
#   gg_format_axis_title_x(farbe="black", druck="bold", groesse=12) +
#   gg_format_axis_title_y(farbe="black", druck="bold", groesse=12, winkel=90) # horizontal>0
# # gg_remove_panel

#......................................................................
# Code to get axis limits defined by ggplot:
#......................................................................
# gg <- ggplot(...)
# ggplot_build(gg)$panel$ranges[[1]]$y.major_source
# ggplot_build(gg)$panel$ranges[[1]]$y.range #[2]
# ggplot_build(gg)$panel$ranges[[1]]
# min(ggplot_build(gg)$panel$ranges[[1]]$y.major_source)

#......................................................................
# Functions:
#......................................................................
gg_title <- function(titel) {
  if (ggplot2.version.number > old.version) {
    ggtitle(titel)
  } else {
    opts(title=titel)
  }}
#......................................................................
## gg_format_axis_text_x(farbe="black", druck="bold", groesse=12)
gg_format_axis_text_x <- function(farbe, druck, groesse) {
  if (ggplot2.version.number > old.version) {
    theme(axis.text.x = element_text(colour=farbe, face=druck, size=groesse))
  } else {
    opts(axis.text.x = theme_text(colour=farbe, face=druck, size=groesse))
  }}
#......................................................................
## gg_format_plot_title(farbe="black", druck="bold", groesse=14, vvjust=-1)
gg_format_plot_title <- function(farbe, druck, groesse, vvjust=-1) {
  if (ggplot2.version.number > old.version) {
    theme(plot.title = element_text(colour=farbe, face=druck, size=groesse, vjust = vvjust))
  } else {
    opts(plot.title = theme_text(colour=farbe, face=druck, size=groesse, vjust = vvjust))
  }}
#......................................................................
## gg_format_axis_text_y(farbe="black", druck="bold", groesse=11)
gg_format_axis_text_y <- function(farbe, druck, groesse) {
  if (ggplot2.version.number > old.version) {
    theme(axis.text.y = element_text(colour=farbe, face=druck, size=groesse))
  } else {
    opts(axis.text.y = theme_text(colour=farbe, face=druck, size=groesse))
  }}
#......................................................................
## gg_format_axis_title_x(farbe="black", druck="bold", groesse=12)
gg_format_axis_title_x <- function(farbe, druck, groesse) {
  if (ggplot2.version.number > old.version) {
    theme(axis.title.x = element_text(colour=farbe, face=druck, size=groesse))
  } else {
    opts(axis.title.x = theme_text(colour=farbe, face=druck, size=groesse))
  }}
#......................................................................
## gg_format_axis_title_y(farbe="black", druck="bold", groesse=12, winkel=360)
gg_format_axis_title_y <- function(farbe, druck, groesse, winkel) {
  if (ggplot2.version.number > old.version) {
    theme(axis.title.y = element_text(colour=farbe, face=druck, size=groesse, angle=winkel))
  } else {
    opts(axis.title.y = theme_text(colour=farbe, face=druck, size=groesse,angle=winkel))
  }}
#......................................................................
gg_remove_panel <- function() {
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank())
}
#......................................................................
gg_remove_legend <- function () {
  theme(legend.position="none")
}
#......................................................................
gg.def.fct <- function(font.size=12) {
  font.size.bigger=font.size+2
  return(
    gg_format_plot_title(farbe="black", druck="bold", groesse=font.size.bigger, vvjust=1) +
      gg_format_axis_text_x(farbe="black", druck="bold", groesse=font.size) +
      gg_format_axis_text_y(farbe="black", druck="bold", groesse=font.size) +
      gg_format_axis_title_x(farbe="black", druck="bold", groesse=font.size) +
      gg_format_axis_title_y(farbe="black", druck="bold", groesse=font.size, winkel=90) + # horizontal>0
      theme(legend.title = element_text(size = font.size, face = 'bold')) +
      theme(legend.text = element_text(size = font.size))
  )
}