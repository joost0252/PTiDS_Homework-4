# exercise 3 - bacteria 

#packages  
source("Setup.R")

# definie terms 
N = 25 # number of bacteria
Zeros = c() # bacterium starting points x0,y0



# generate 25 random initial points x0,y0

for(i in 1:N){
    #get the 1st value of punif(-8,8) and append it to Zeros
    x_0 = runif(100,min =-8,max = 8)[1]
    y_0 = runif(100,min =-8,max = 8)[1]

    Zeros <- append(Zeros,c(x_0,y_0))
}
zeros_pts<-Zeros %>% matrix(,nrow = 25,ncol = 2) 
colnames(zeros_pts)<-c("x0","y0")
#zeros_pts
my_values = c()
# function that does the simulations
myfunct <- function(z0){
    my_values = c() # valeus functions

    #parameters 
    a = 0 
    b = 2 
    S = runif(121,a,b) # uniform distribution of bacteria
    t = c(1:121) # iterations
    gamma = runif(121,0,2*pi)
    cos_sin = matrix(c(cos(gamma),sin(gamma)),nrow =121,ncol= 2)

    # simulations 
    for(i in 1:N){
        k = z0[i,]
        for(t in 1:121){
            f[t+1] = f[t] + S[t] *cos_sin[t,]  # find a way to do the iteration with f t+1

            my_values <- append(my_values,f[t+1])
        }
    }
    #bacteria <- my_values %>% matrix(,nrow = 121,ncol = 25)
    return(my_values)
}

myfunct(zeros_pts)

# create cirle of radius 3 centered at (0,0)
gamma = runif(121,0,2*pi)
cos_sin = matrix(c(cos(gamma),sin(gamma)),nrow =121,ncol= 2)

S = runif(121,a,b)
zeros_pts[25,] + S[111] *cos_sin[111,] 







# plot a cirle of radius 3 centered at (0,0)

plot(-10:10,type ='n', xlim = c(-10,10),ylim = c(-10,10),xlab = "X Position",
ylab = "Y Position",main = "Bacteria Motility")
plotrix::draw.circle(0,0,3, col = 'orange')
#write 'SUGAR'title in draw.circle

library(ggplot2)
library(ggforce)

#use geom_circle to plot a circle of radius 3 centered at (0,0) title the circle 'SUGAR'

ggplot() + geom_circle(x = 0, y = 0, r = 3, col = 'orange') + 
  scale_x_continuous(limits = c(-10,10)) + 
  scale_y_continuous(limits = c(-10,10)) + 
  labs(x = "X Position", y = "Y Position", title = "Bacteria Motility")

