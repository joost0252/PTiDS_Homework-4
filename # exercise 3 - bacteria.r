# exercise 3 - bacteria

#packages
source("Setup.R")
install.packages('gganimate')
library(gganimate)
library(ggplot2)
library(ggforce)
library(transformr)
# definie terms
N = 25 # number of bacteria
Zeros = c() # bacterium starting points x0,y0



# generate 25 random initial points x0,y0

for(i in 1:N){
    #get the 1st value of punif(-8,8) and append it to Zeros
    x_0 = runif(1000,min =-8,max = 8)[1]
    y_0 = runif(1000,min =-8,max = 8)[1]

    Zeros <- append(Zeros,c(x_0,y_0))
}
zeros_pts<-Zeros %>% matrix(,nrow = 25,ncol = 2)
colnames(zeros_pts)<-c("x","y")
#zeros_pts
my_values = c()
# function that does the simulations
myfunct <- function(z0){
    my_values = c() # valeus functions

    #parameters
    a = 0
    b = 2
    S = runif(1000,min = a,max = b) # uniform distribution of bacteria
    t = c(1:121) # iterations
    gamma = runif(121,min = 0,max = 2*pi)
    cos_sin = matrix(c(cos(gamma),sin(gamma)),nrow =121,ncol= 2)

    # simulations
    for(i in 1:N){
        k = z0[i,]
        for(t in 1:121){
            f = k + S[t] *cos_sin[t,]  # find a way to do the iteration with f t+1
            my_values <- append(my_values,f)
           # mat_i <-my_values %>% matrix(,nrow = 121,ncol = 2, byrow = TRUE)
        }
        #print(mat_i) # print the matrix of each bacteria
        #df <- data.frame(mat_i)
    }
    #slice my_valeus 2 by 2 to get the x and y values

    return(my_values)
}
myfunct(zeros_pts)

# create cirle of radius 3 centered at (0,0)
#gamma = runif(121,0,2*pi)
#cos_sin = matrix(c(cos(gamma),sin(gamma)),nrow =121,ncol= 2)

#S = runif(121,min = 0 ,max = 2)
zeros_pts[25,] + S[111] *cos_sin[111,]  # output in 2D

#f = k + S[t] *cos_sin[t,]


# get a df 121 x50 then melt it to do once geom_line



#use geom_circle to plot a circle of radius 3 centered at (0,0) title the circle 'SUGAR'
staticplot<-ggplot(data = A_1) +
geom_circle(aes(x0 = 0, y0 =0,r = 3), color = "orange", fill ='orange') +
geom_text(aes(x=0,y=0,label = "SUGAR"),size = 15,color = 'white') +
geom_line(aes(x=x,y=y),color =1)+
geom_line(data = B,aes(x=x,y=y),color =2)+
  geom_line(data = C,aes(x=x,y=y))+
  geom_line(data = E,aes(x=x,y=y),color =4)+geom_line(data = D,aes(x=x,y=y),color =3)+
  geom_line(data = F,aes(x=x,y=y),color =5)+
  geom_line(data = G,aes(x=x,y=y),color =6)+
  geom_line(data = H,aes(x=x,y=y),color =7)+
  geom_line(data = I,aes(x=x,y=y),color =8)+
  geom_line(data = J,aes(x=x,y=y),color =9)+
  geom_line(data = K,aes(x=x,y=y),color =10)+
  geom_line(data = L,aes(x=x,y=y),,color =11)+
  geom_line(data = M,aes(x=x,y=y),color =12)+
  geom_line(data = N,aes(x=x,y=y),color =13)+
  geom_line(data = O,aes(x=x,y=y),color =14)+
  geom_line(data = P,aes(x=x,y=y),,color =15)+
  geom_line(data = Q,aes(x=x,y=y),color =16)+
  geom_line(data = R,aes(x=x,y=y),,color =17)+
  geom_line(data = S,aes(x=x,y=y),color =18)+
  geom_line(data = T,aes(x=x,y=y),color =19)+
  geom_line(data = W,aes(x=x,y=y),color=20)+
  geom_line(data = X,aes(x=x,y=y),color =21)+
  geom_line(data = Y,aes(x=x,y=y),color =22)+
xlim(-10,10) +
ylim(-10,10) +
xlab("X Position") +
ylab("Y Position") +
theme_bw()+
ggtitle("Bacteria Motility") + theme(plot.title = element_text(hjust = 0.5))

geom_line(data = B,aes(x=x,y=y))+geom_line(data = B,aes(x=x,y=y),color = 'blue')+# animation
  A_1 <-data.frame(A,"time" = seq(1,121,by=1))
anim = staticplot + transition_states(time, transition_length = 4, state_length = 1) +
  view_follow(fixed_x = TRUE)  +
  labs(title = 'Bacteria Motility')

animate(anim)

time = seq(1,121,by=1)


staticplot






 #parameters
a = 0
b = 2
S = runif(1000,min = a,max = b) # uniform distribution of bacteria
t = c(1:121) # iterations
gamma = runif(121,min = 0,max = 2*pi)
cos_sin = matrix(c(cos(gamma),sin(gamma)),nrow =121,ncol= 2)

# simulations
for(i in 1:N){
    k = zeros_pts[i,]
    for(t in 1:121){
        f = k + S[t] *cos_sin[t,]  # find a way to do the iteration with f t+1
        my_values <- append(my_values,f)
    }
}
#create a dateframe with the values of my_values, colnames = x,y

df <-my_values %>% split(,f = c('x','y')) %>% data.frame()
my_values[[2]]

    for (i in seq(from =1,to =3025,by = 122)){
        for(j in split){
        #d=df[c(i:j),]
       # print(d)
        }
    d=df[c(i:j),]
    print(d)
    }



A=df[1:121,]
B=df[122:242,]
C=df[243:363,]
D=df[364:484,]
E=df[485:605,]
F=df[606:726,]
G=df[727:847,]
H=df[848:968,]
I=df[969:1089,]
J=df[1090:1210,]
K=df[1211:1331,]
L=df[1332:1452,]
M=df[1453:1573,]
N=df[1574:1694,]
O=df[1695:1815,]
P=df[1816:1936,]
Q=df[1937:2057,]
R=df[2058:2178,]
S=df[2179:2299,]
T=df[2300:2420,]
U=df[2421:2541,]
V=df[2542:2662,]
W=df[2663:2783,]
X=df[2784:2904,]
Y=df[2905:3025,]
df_1 <- cbind(A,B,C,D,E,F,G,H,I,G,K,L,M,N,O,P,Q,R,S,T,U,V,W,Y)
sexo<-melt(df_1)
colnames(A)
colnames(A)<-c('x1','y1')
A
colnames(B)<-c('x2','y2')
B
sexo<-cbind(A,B,time)[1,] %>% as.data.frame() %>% group_by(1)
sexo2<-cbind(A,B,time)[2,] %>% as.data.frame() %>% group_by(2)
sexo3<-cbind(A,B,time)[3,] %>% as.data.frame() %>% group_by(3)
sexo4<-cbind(A,B,time)[4,] %>% as.data.frame() %>% group_by(4)
sexo5<-cbind(A,B,time)[5,] %>% as.data.frame() %>% group_by(5)
sexo
sexo2
?group_by()


staticplot2<-ggplot() +
  geom_circle(aes(x0 = 0, y0 =0,r = 3), color = "orange", fill ='orange') +
  geom_text(aes(x=0,y=0,label = "SUGAR"),size = 15,color = 'white') +
  geom_line(data=sexo,aes(x=x,y=y,group=1),color =1)+
  geom_line(data = sexo2,aes(x=x,y=y,group=2),color =2)+
  geom_line(data = sexo3,aes(x=x,y=y,group=3))+
  geom_line(data = sexo4,aes(x=x,y=y,group=4),color =4)+geom_line(data = sexo5,aes(x=x,y=y,group=5),color =3)+
  xlim(-10,10) +
  ylim(-10,10) +
  xlab("X Position") +
  ylab("Y Position") +
  theme_bw()+
  ggtitle("Bacteria Motility") + theme(plot.title = element_text(hjust = 0.5))




anim1 = staticplot2+ transition_states(time, transition_length = 4, state_length = 1) +
  view_follow(fixed_x = TRUE)  +
  labs(title = 'Bacteria Motility')

animate(anim1)
?animate()


anim







