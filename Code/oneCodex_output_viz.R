data_oneCodex=read.csv("table_onecodex.csv",header=T,sep=",")

sub_data_oneCodex <- subset(data_oneCodex, as.numeric(as.character(readcount)) > 20 & rank =="species", select=c(file, name, readcount))

sub_data_oneCodex$file=gsub("\\.", "_", as.character(sub_data_oneCodex$file))

reformat_name=function(name_file){
  paste(strsplit(as.character(name_file),"_")[[1]][3:4],sep="_",collapse="_")
}

reformat_name(sub_data_oneCodex$file[1])

sub_data_oneCodex$file=sapply(sub_data_oneCodex$file,reformat_name)

head(sub_data_oneCodex)

library(reshape2)
m <- dcast(sub_data_oneCodex,file~name,value.var="readcount")

m=t(data.matrix(m))
m[is.na(m)]=1

m=m[-1,]
colnames(m)=unique(sub_data_oneCodex$file)
my_palette <- colorRampPalette(c("white", "green","darkgreen","black"))(n = 20)

library("gplots")
par(mar=c(7,4,4,10)+0.1)
heatmap.2(log(m),col=my_palette,scale="none", 
          key=TRUE, symkey=FALSE, 
          density.info="none", trace="none", 
          cexRow=0.5,cexCol=0.5)


#########
Data.pca <- prcomp(t(log(m))) 

#Color of Beer Data$X.L 
#my_pal=colorRampPalette(c("lightyellow","yellow","red","orange","brown","black"))(35)

library(ggfortify)
library(cluster)
library(ggplot2)

autoplot(Data.pca, data=t(log(m)) ,label = TRUE,size=0.5)
print(Data.pca)
plot(Data.pca, type = "l")
summary(Data.pca)


#Dendrogram
library(ggdendro)
hc <- hclust(dist(
  t(log(m))), "complete")
ggdendrogram(hc, rotate = FALSE, size = 2)

#hc <- hclust(cor(log(m),method="kendall")) # "kendall" method="spearman"

dendr <-dendro_data(hc, type="rectangle") 
ggplot() + 
  geom_segment(data=segment(dendr), aes(x=x, y=y, xend=xend, yend=yend)) + 
  geom_text(data=label(dendr), aes(x=x, y=y, label=label, hjust=0, size=3)) +
  scale_y_reverse(expand=c(0.2, 0)) +   coord_flip()+
  theme(axis.line.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.text.y=element_blank(),
        axis.title.y=element_blank(),
        panel.background=element_rect(fill="white"),
        panel.grid=element_blank())

  
library(ape)
plot(as.phylo(hc),type="unr") 