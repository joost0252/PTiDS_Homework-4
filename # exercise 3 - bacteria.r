# exercise 3 - bacteria

# Problem I have is related to ggplot + animation + the type of my features in df: 
# geom_path: Each group consists of only one observation. Do you need to adjust
# the group aesthetic?




#packages
source("Setup.R")
install.packages('gganimate')
library(gganimate)
library(transformr)
library(ggplot2)
library(ggforce)
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
my_values = c()
#zeros_pts

# function that does the simulations
#myfunct <- function(z0){
#    my_values = c() # valeus functions

    #parameters
#    a = 0
#    b = 2
#    S = runif(1000,min = a,max = b) # uniform distribution of bacteria
#    t = c(1:121) # iterations
 #   gamma = runif(121,min = 0,max = 2*pi)
#    cos_sin = matrix(c(cos(gamma),sin(gamma)),nrow =121,ncol= 2)

    # simulations
        k = z0[i,]
 #   for(i in 1:N){
 #       for(t in 1:121){
  #          f = k + S[t] *cos_sin[t,]  # find a way to do the iteration with f t+1
    #        my_values <- append(my_values,f)
   #        # mat_i <-my_values %>% matrix(,nrow = 121,ncol = 2, byrow = TRUE)
     #   }
        #print(mat_i) # print the matrix of each bacteria
        #df <- data.frame(mat_i)
    #}
    #slice my_valeus 2 by 2 to get the x and y values

    #return(my_values)
#}
#myfunct(zeros_pts)

# create cirle of radius 3 centered at (0,0)
#gamma = runif(121,0,2*pi)
#cos_sin = matrix(c(cos(gamma),sin(gamma)),nrow =121,ncol= 2)

#S = runif(121,min = 0 ,max = 2)
#zeros_pts[25,] + S[111] *cos_sin[111,]  # output in 2D

#f = k + S[t] *cos_sin[t,]

        
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
#df
        
# each letter = 1 bacteria simulations 
A=df[1:121,]
A[1,] <- c(zeros_pts[1,])
B=df[122:242,]
B[1,]<- c(zeros_pts[2,])
C=df[243:363,]
C[1,]<- c(zeros_pts[3,])
D=df[364:484,]
D[1,]<- c(zeros_pts[4,])
E=df[485:605,]
E[1,]<- c(zeros_pts[5,])
F=df[606:726,]
F[1,]<- c(zeros_pts[6,])
G=df[727:847,]
G[1,]<- c(zeros_pts[7,])
H=df[848:968,]
H[1,]<- c(zeros_pts[8,])
I=df[969:1089,]
I[1,]<- c(zeros_pts[9,])
J=df[1090:1210,]
J[1,]<- c(zeros_pts[10,])
K=df[1211:1331,]
K[1,]<- c(zeros_pts[11,])
L=df[1332:1452,]
L[1,]<- c(zeros_pts[12,])
M=df[1453:1573,]
M[1,]<- c(zeros_pts[13,])
N=df[1574:1694,]
N[1,]<- c(zeros_pts[14,])
O=df[1695:1815,]
O[1,]<- c(zeros_pts[15,])
P=df[1816:1936,]
P[1,]<- c(zeros_pts[16,])
Q=df[1937:2057,]
Q[1,]<- c(zeros_pts[17,])
R=df[2058:2178,]
R[1,]<- c(zeros_pts[18,])
S=df[2179:2299,]
S[1,]<- c(zeros_pts[19,])
T=df[2300:2420,]
T[1,]<- c(zeros_pts[20,])
U=df[2421:2541,]
U[1,]<- c(zeros_pts[21,])
V=df[2542:2662,]
V[1,]<- c(zeros_pts[22,])
W=df[2663:2783,]
W[1,]<- c(zeros_pts[23,])
X=df[2784:2904,]
X[1,]<- c(zeros_pts[24,])
Y=df[2905:3025,]
Y[1,]<- c(zeros_pts[25,])
df_1 <- cbind(A,B,C,D,E,F,G,H,I,G,K,L,M,N,O,P,Q,R,S,T,U,V,W,Y)
sexo<-melt(df_1)

colnames(A)<-c('x1','y1')
colnames(B)<-c('x2','y2')
colnames(C)<-c('x3','y3')
colnames(D)<-c('x4','y4')
colnames(E)<-c('x5','y5')
colnames(F)<-c('x6','y6')
colnames(G)<-c('x7','y7')
colnames(H)<-c('x8','y8')
colnames(I)<-c('x9','y9')
colnames(J)<-c('x10','y10')
colnames(K)<-c('x11','y11')
colnames(L)<-c('x12','y12')
colnames(M)<-c('x13','y13')
colnames(N)<-c('x14','y14')
colnames(O)<-c('x15','y15')
colnames(P)<-c('x16','y16')
colnames(Q)<-c('x17','y17')
colnames(R)<-c('x18','y18')
colnames(S)<-c('x19','y19')
colnames(T)<-c('x20','y20')
colnames(U)<-c('x21','y21')
colnames(V)<-c('x22','y22')
colnames(W)<-c('x23','y23')
colnames(X)<-c('x24','y24')
colnames(Y)<-c('x25','y25')
        
      
## plots         



#use geom_circle to plot a circle of radius 3 centered at (0,0) title the circle 'SUGAR'
staticplot<-ggplot() +
  geom_circle(aes(x0 = 0, y0 =0,r = 3), color = "orange", fill ='orange') +
  geom_text(aes(x=0,y=0,label = "SUGAR"),size = 15,color = 'white') +
  geom_line(data = test_A,aes(x=x1,y=y1,group = 1),color =1)+
  geom_line(data = test_B,aes(x=x2,y=y2,group=2),color =2)+
  geom_line(data = C,aes(x=x3,y=y3))+
  geom_line(data = E,aes(x=x5,y=y5),color =4)+
  geom_line(data = D,aes(x=x4,y=y4),color =3)+
  geom_line(data = F,aes(x=x6,y=y6),color =5)+
  geom_line(data = G,aes(x=x7,y=y7),color =6)+
  geom_line(data = H,aes(x=x8,y=y8),color =7)+
  geom_line(data = I,aes(x=x9,y=y9),color =8)+
  geom_line(data = J,aes(x=x10,y=y10),color =9)+
  geom_line(data = K,aes(x=x11,y=y11),color =10)+
  geom_line(data = L,aes(x=x12,y=y12),color =11)+
  geom_line(data = M,aes(x=x13,y=y13),color =12)+
  geom_line(data = N,aes(x=x14,y=y14),color =13)+
  geom_line(data = O,aes(x=x15,y=y15),color =14)+
  geom_line(data = P,aes(x=x16,y=y16),color =15)+
  geom_line(data = Q,aes(x=x17,y=y17),color =16)+
  geom_line(data = R,aes(x=x18,y=y18),color =17)+
  geom_line(data = S,aes(x=x19,y=y19),color =18)+
  geom_line(data = T,aes(x=x20,y=y20),color =19)+
  geom_line(data = U,aes(x=x21,y=y21),color=20)+
  geom_line(data = V,aes(x=x22,y=y22),color =21)+
  geom_line(data = W,aes(x=x23,y=y23),color =22)+
  geom_line(data = X,aes(x=x24,y=y24),color =23)+
  geom_line(data = Y,aes(x=x25,y=y25),color =24)+
  xlim(-10,10) +
  ylim(-10,10) +
  xlab("X Position") +
  ylab("Y Position") +
  theme_bw()+
  ggtitle("Bacteria Motility") + theme(plot.title = element_text(hjust = 0.5))

#geom_line(data = B,aes(x=x,y=y))+geom_line(data = B,aes(x=x,y=y),color = 'blue')# animation
#A_1 <-data.frame(A,"time" = seq(1,121,by=1))


anim = staticplot + transition_states(time, transition_length = 4, state_length = 1) +
  view_follow(fixed_x = TRUE)  +
  labs(title = 'Bacteria Motility')

animate(anim)

time = seq(1,121,by=1)


#staticplot

test_A<-A %>% group_by(1)%>% summarise(x1=x1,
                               y1=y1)
test_B <- B %>% group_by(2)%>% summarise (x2 = x2,
                                          y2 = y2) 




#sexo10<-df_1 %>% melt()







#sexo<-cbind(A,B,time) %>% as.data.frame() %>% group_by(x1,y1) %>% 
#  summarise(X = x1,
 #           Y = x2,
#            time)
#sexo2<-cbind(A,B,time)[2,] %>% as.data.frame() %>% group_by(2)
#sexo3<-cbind(A,B,time)[3,] %>% as.data.frame() %>% group_by(3)
#sexo4<-cbind(A,B,time)[4,] %>% as.data.frame() %>% group_by(4)
#sexo5<-cbind(A,B,time)[5,] %>% as.data.frame() %>% group_by(5)
#sexo
#sexo2
#group_by()


staticplot2<-ggplot() +
  geom_circle(aes(x0 = 0, y0 =0,r = 3), color = "orange", fill ='orange') +
  geom_text(aes(x=0,y=0,label = "SUGAR"),size = 15,color = 'white') +
  geom_line(data = A_1,aes(x=x1,y=y1,group=2))+
  #geom_line(data =B_1,aes(x=x2,y=y2),color =2)+
  #geom_line(data = A,aes(x=x1,y=y1))+
  #geom_line(data = sexo,aes(x=x,y=y,group=2),color =2)+
  #geom_line(data = sexo3,aes(x=x,y=y,group=3))+
  #geom_line(data = sexo4,aes(x=x,y=y,group=4),color =4)+geom_line(data = sexo5,aes(x=x,y=y,group=5),color =3)+
  xlim(-10,10) +
  ylim(-10,10) +
  xlab("X Position") +
  ylab("Y Position") +
  theme_bw()+
  ggtitle("Bacteria Motility") + theme(plot.title = element_text(hjust = 0.5))

#sexo10 %>% head(5)
#str(A)

#A_1<-data.frame(lapply(A,as.numeric))
#B_1<-data.frame(lapply(B, as.numeric))
#?apply

#str(time)
anim = staticplot+ transition_reveal(time)+
  view_follow(fixed_x = TRUE)  +
  labs(title = 'Bacteria Motility')

anim
animate()

staticplot2+transition_reveal(time)



#melt(df_1,split(x,y))
anim2 = staticplot2 + 
  transition_reveal(time)+
  labs(title = 'Bacteria Motility')

anim2
#?split()
#paste0(A[,1],A[,2]) 

#lol<-t(test_A) %>% as.data.frame()
#lol1<-t(test_B)%>% as.data.frame()
#unite(df_1[,c(1,2)],c())
#mutate(df_1, paste(c('x1','y1'))) %>% str()
#df_1

#A[,1] %>% str()
#?unite()
