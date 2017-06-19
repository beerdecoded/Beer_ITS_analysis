library(dplyr)
library(ggfortify)
library(cluster)
library(ggplot2)
library(reshape2)
library(RColorBrewer)
library(ape)
library(ggdendro)
library(gplots)

# Id_mapping=read.table("species_ID_mapping.txt",sep=" ")
# BeerDecoded_seq_res=read.table("Beer_results_all.txt",sep = " ")
# ii=match(BeerDecoded_seq_res[,2],Id_mapping[,1])
# 
# BeerDecoded_seq_res[,4]=paste(Id_mapping[ii,2],Id_mapping[ii,3],sep =" ")
# 
# BeerDecoded_seq_res_clean=filter(BeerDecoded_seq_res,V2!="" & V1>=10)
# colnames(BeerDecoded_seq_res_clean)=c("counts","sp_ID","Beer","sp_name")
# 
# write.csv(BeerDecoded_seq_res_clean,file = "BeerDecoded_seq_res_clean.csv",col.names = F,quote =F)

BeerDecoded_seq_res_clean=read.csv("BeerDecoded_seq_res_clean.csv")

Beer_mat=acast(BeerDecoded_seq_res_clean, Beer~sp_name, value.var="counts")
Beer_mat[which(is.na(Beer_mat))]=0

write.csv(Beer_mat,file = "BeerDecoded_mat.csv",quote =F)

pdf("beer_analysis.pdf",width=8, height=8,useDingbats=F)
log.Beer_mat=log(Beer_mat+1)
res.pca = PCA(log.Beer_mat, scale.unit=TRUE, ncp=8, graph=F)
plot.PCA(res.pca,cex=0.8,axes = c(1, 2))

hc <- hclust(dist(
  log.Beer_mat), "ward.D")
ggdendrogram(hc, rotate = T, size = 0.5)
#plot(as.phylo(hc),type="radial") 
mypal = brewer.pal(10,"Dark2")
# cutting dendrogram in 5 clusters
clus5 = cutree(hc, 10)
# plot
op = par(bg = "#E8DDCB")
# Size reflects miles per gallon
plot(as.phylo(hc), type = "fan", tip.color = mypal[clus5], label.offset = 1, 
     cex = 1., col = "red")

BeerDecoded_seq_res_clean_sel=dplyr::filter(BeerDecoded_seq_res_clean,counts >= 10)

beer_var=as.data.frame(table(BeerDecoded_seq_res_clean_sel$Beer))

ggplot(beer_var, aes(x = reorder(Var1, Freq), y = Freq)) + 
  geom_bar(stat = "identity",colour="brown",fill="#ffd500")+coord_flip()+xlab("Beer")+ylab("ITS variety")+theme_bw()

Taxon_var=as.data.frame(table(BeerDecoded_seq_res_clean_sel$sp_name))


my_palette <- colorRampPalette(c("white","yellow","orange","red"))(n = 5)
op = par(bg = "white")
#heatmap(log(Beer_mat[,colnames(Beer_mat) %in% dplyr::filter(Taxon_var,Freq >1)$Var1]+0.0001))

heatmap.2(log10(Beer_mat[,colnames(Beer_mat) %in% dplyr::filter(Taxon_var,Freq >1)$Var1]+0.00001),
         # cellnote = mat_data,  # same data set for cell labels
          main = "Beer ITS content", # heat map title
          notecol="black",      # change font color of cell labels to black
          density.info="none",  # turns off density plot inside color legend
          trace="none",         # turns off trace lines inside the heat map
          margins =c(12,16),     # widens margins around plot
          col=my_palette,       # use on color palette defined earlier
          #breaks=col_breaks,    # enable color transition at specified limits
          dendrogram="both",     # only draw a row dendrogram
          Colv="Rowv")            # turn off column clustering


ggplot(dplyr::filter(Taxon_var,Freq >1), aes(x = reorder(Var1, Freq), y = Freq)) + 
  geom_bar(stat = "identity",colour="brown",fill="#ffd500")+coord_flip()+xlab("Taxon")+ylab("beer variety")+theme_bw()

for(beer in unique(BeerDecoded_seq_res_clean$Beer)){
  p=ggplot(filter(BeerDecoded_seq_res_clean,Beer==beer), aes(x = reorder(sp_name, counts), y = log10(counts))) + ggtitle(beer)+
    geom_bar(stat = "identity",colour="darkgrey",fill="darkgreen")+coord_flip()+xlab("ITS")+ylab("log10 counts")+theme_bw()
print(p)
  }
dev.off()


QC=read.table("beer_lib_sizes.txt")

