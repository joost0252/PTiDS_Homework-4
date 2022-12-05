library("circular")
library("Directional")
library("plotrix")
library("raster")
library("ggforce")
#k = c * abs(c(xt, yt))

#Formula for k (and c)

#Formula including number of bacteria

#Simulation seed

#Bacteria inside sugar indicated

#random variable delta(t) due to random seed

#x <- rvonmises(N, m, k, rads = TRUE)
#pp.plot(x)

#Variables that can be defined before calculations:
seed = 123456 #will be user input
c = 25 # wordt user input value
N = 20 #will be user input

## seed based on user input

#bacteria_function <- function(N, c, seed)


#center of sugar is (0,0) and radius
censug = c(0,0)
r = 3

## Number of bacterias based on user input


## St
set.seed(seed) #will be user input
St = runif(N, min = 0, max = 2)

## Variable c based on user input


##empty vector for k
k = c()


#Starting position for bacteria i
xpos = c()
ypos = c()
for (i in 1:N){
  set.seed(seed)
  xpos = runif(N, min = -8, max = 8)
  ypos = runif(N, min = -8, max = 8)
}

#Create dataframes for bacteria positions
bac_df = data.frame()
matrix_empty = matrix(nrow = 20, ncol = 0)
bac_df_new = data.frame(matrix_empty)
datalist = list()
bac_num = c()


endcycle = 1

while (endcycle != 100) { #deze veranderen naar de slider input
  
  mu = c()
  #for (i in 1:N){
    #if (ypos[i] >= 0){
      #mu[i] = -90 - atan2(ypos[i],xpos[i]) * 180 / pi
    #} else{
      #mu[i] = -90 + atan2(ypos[i],xpos[i]) * 180 / pi
    #}
  #}
  
  for (i in 1:N){
    if (xpos[i] <= 0 && ypos[i] <= 0){
      mu[i] = atan(abs(ypos[i])/abs(xpos[i]))
    } else if (xpos[i] > 0 && ypos[i] <= 0){
      mu[i] = pi - atan(abs(ypos[i])/abs(xpos[i]))
    } else if (xpos[i] > 0 && ypos[i] > 0){
      mu[i] = (1.5 * pi) - atan(abs(xpos[i])/abs(ypos[i]))
    } else {
      mu[i] = (1.5*pi) + atan(abs(xpos[i])/abs(ypos[i]))
    }
  }
  
  #k based on position
  xposk = c()
  yposk = c()
  for (i in 1:N){
    xposk[i] <- xpos[i] - censug[1]
    yposk[i] <- ypos[i] - censug[2]
  }
  #locbac <- data.frame(locbacx, locbacy)
  k <- c*((sqrt((xposk[1]^2) + (yposk[2]^2)))^-1)
  
  #delta t (here called i) for every bacteria
  delta = c()
  delta = rvonmises(N, mu, k, rads=TRUE)
  

  #Next location for bacteria
  for (i in 1:N){
    xpos[i] <- xpos[i] + St[i]*(cos(delta[i]))
    ypos[i] <- ypos[i] + St[i]*(sin(delta[i]))
  }
  
  #xpos <- xpos$endcycle
  
  for (i in 1:N){
    
    bac_num[i] = i
    #bac_num[i] <- paste("Bacteria" + bac_num[i])

  }
  bac_df <- data.frame(xpos, ypos, bac_num)
  #bac_df <- data.frame(xpos, ypos)
  #x_it <- paste("x", toString(endcycle))
  #y_it <- paste("y", toString(endcycle))
  #colnames(bac_df) <- c(x_it, y_it)
  bac_df_new <- rbind(bac_df_new, bac_df)
  
 
  
  #distance to center circle:
  discen = c()
  incircle = c()
  for (i in 1:N){
    discen[i] = sqrt((xpos[i])^2 + (ypos[i])^2)
    incircle[i] = discen[i] - r
  }
  
  #if (all(incircle < 0)) {
    endcycle = 1+endcycle
  #}
    
}


p <- ggplot(
  bac_df_new,
  aes(xpos, ypos, group = bac_num, color = factor(bac_num))) +
  geom_line(show.legend=FALSE) +
  scale_color_viridis_d() +
  labs(x = "X Position", y = "Y Position") +
  geom_circle(aes(x0=0, y0=0, r=3), linetype='solid', color='orange', fill='orange', lwd=.5, inherit.aes=FALSE) +
  theme(legend.position = "none") + 
  geom_point()
p


#bovenstaande startpositie verwerken als ik in de shinyapp, maar inplaats van de slidervalues die Von Mises distributie, dus
#waarschijnlijk eerst bovenstaande startpositie verwerken in een formule voor die von Mises distributie

#von mises package

#x <- rvonmises(n=25, mu=circular(0), kappa=10)
#x <- rvonmises(10, 100, 0, rads = TRUE)
#pp.plot(x)


