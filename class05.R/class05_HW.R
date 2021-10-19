#' ---
#' title: "Class 5: Data Visualization"
#' author: "Natalie Avina (A15590695)"
#'
#' ---
#before using ggplot you need to load it up with library
library(ggplot2)

#ggplot has data + aes + geoms
#geom_line is a trendline where geom_line treats it as consecutive data
ggplot(data=cars)+ aes(x=speed, y=dist) + geom_point() + geom_smooth()

#change to a linear model and save as p to call it forward when needed
p <- ggplot(data=cars)+ aes(x=speed, y=dist) + geom_point() + geom_smooth(method="lm", se=FALSE)
p + labs(title="Speed and Stopping Distance of Cars", x= "Speed (MPH)", y= "Distance (ft)", subtitle = "relationship between speed and distance required for stopping",caption= "Dataset:cars")



#base graphics is shorter: plot (cars)
## Warning: It is deprecated to specify `guide = FALSE` to remove a guide. Please
## use `guide = "none"` instead.
# to change size of points use size= parameter in aes
# to change color point use color=
# to change transparency use alpha=

url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

#Q. how many genes?
nrow(genes)

#how to access State column
table(genes$State)

#Q. How many genes are down regulated?
table(genes$State)/nrow(genes)

#Q. What % is up/down?
perc<- table(genes$State)/nrow(genes)*100
#round
round(perc, 2)
colnames(genes)
ncol(genes)
ggplot(genes) +
  aes(x=Condition1, y=Condition2, col=State)+
  geom_point()
v <- ggplot(genes) +
  aes(x=Condition1, y=Condition2, col=State)+
  geom_point()
v + scale_color_manual(values = c("lightblue3", "darkseagreen3", "rosybrown3")) +
  labs(title="Gene Expression ", x= "Control (no drug)", y= "Drug Treatment")

# File location online
url2 <- "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv"

gapminder <- read.delim(url2)
install.packages("dplyr")  ## uncoment to install if needed
library(dplyr)

gapminder_2007 <- gapminder %>% filter(year==2007)
