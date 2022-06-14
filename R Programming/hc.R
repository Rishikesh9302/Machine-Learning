# Hierarchical Clustering

#Importing the Mall Dataset
dataset=read.csv("Mall_Customers.csv")
X=dataset[4:5]

#Using the dendogram to find optimalnumber of clusters
dendrogram=hclust(dist(X,method='euclidean'),method='ward.D')
plot(dendrogram,
     main=paste('Dendrogram'),
     xlab='Customers',
     ylab='Euclidean distances')

#Fitting hierarchical clsutering to the mall dataset
hc=hclust(dist(X,method='euclidean'),method='ward.D')
y_hc=cutree(hc,5)

#Visualising the clusters
library(cluster)
clusplot(X,
         y_hc,
         lines=0,
         shade=TRUE,
         color=TRUE,
         labels=2,
         plotchar=FALSE,
         span=TRUE,
         main=paste('Clusters of Customers'),
         xlab='Annual Income',
         ylab='Spending Score')