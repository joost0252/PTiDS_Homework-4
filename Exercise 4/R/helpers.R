library("circular")
library("Directional")
library("plotrix")
library("raster")

seed = 123456 #will be user input
c = 25 # wordt user input value
N = 20 #will be user input

#Define St
set.seed(seed)
St = runif(N, min = 0, max = 2)



## Starting possition
xpos = c()
ypos = c()
for (i in 1:N){
  set.seed(seed)
  xpos = runif(N, min = -8, max = 8)
  ypos = runif(N, min = -8, max = 8)
  return(xpos)
  return(ypos)
}

## mu variable function
mu_function <- function(xpos, ypos, N) {
  mu = c()

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
  return(mu)
}

mu <- mu_function(xpos, ypos, N)

## k variable function
k_function <- function(xpos,ypos,N) {
  censug = c(0,0)
  xposk = c()
  yposk = c()
  k = c()
  for (i in 1:N){
    xposk[i] <- xpos[i] - censug[1]
    yposk[i] <- ypos[i] - censug[2]
  }
  #locbac <- data.frame(locbacx, locbacy)
  k <- c*((sqrt((xposk[1]^2) + (yposk[2]^2)))^-1)
  return(k)
}
k <- k_function(xpos,ypos,N)

## delta variable function
delta_function <- function(N, mu, k){
  delta = c()
  delta = rvonmises(N, mu, k, rads=TRUE)
  return(delta)
}

delta <- delta_function(N, mu, k)


#Function for next location bacteria
nextloc_function <- function(St, N, xpos, ypos, delta, inputSlider){

  iteration = 0
  ## Give every bacteria a number
  bac_num = c()
  for (i in 1:N){
    bac_num[i] <- i
    #bac_num[i] <- paste("Bacteria" + bac_num[i])
  }

  ## Create empty dataframe to put locations in
  bac_df = data.frame()
  matrix_empty = matrix(nrow = 20, ncol = 0)
  bac_df_new = data.frame(matrix_empty)

  while (iteration != 0){



    mu <- mu_function(xpos, ypos, N)
    k <- k_function(xpos,ypos,N)
    delta <- delta_function(N, mu, k)


    for (i in 1:N){
      xpos[i] <<- xpos[i] + St[i]*(cos(delta[i]))
      ypos[i] <<- ypos[i] + St[i]*(sin(delta[i]))
    }
    bac_df <<- data.frame(xpos, ypos, bac_num)
    return(bac_df)
    bac_df_new <<- rbind(bac_df_new, bac_df)
    return(bac_df_new)
    iteration <<- iteration + 1
    return(bac_df_new)
  }
}

bac_df_result <- function(St, N, xpos, ypos, delta, bac_num, bac_df, bac_df_new, iteration)
bac_df_result

while (iteration != 10){
  print(iteration)
  iteration = iteration + 1
}

