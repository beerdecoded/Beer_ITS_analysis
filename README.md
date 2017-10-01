![alt text](https://raw.githubusercontent.com/BeerDecodedProject/beer-data/master/assets/logo.png)

At [BeerDeCoded](http://www.genome.beer) we map beer at molecular level to help brewers and beer passionates to make more informed decisions.

We want to create a molecular tree of beers that links beers with similar properties. Akin to a fingerprint, this open information could be used for B2B and B2C projects. For instance, BeerDeCoded will help craft brewers benchmark new recipes against existing products and control their quality.

# Beer_ITS_analysis
## BeerDeCoded first results using ITS mapping

### BeerDeCoded: exploring the beer metagenome

BeerDeCoded is a project carried out by members of Hackuarium, a Swiss not-for-profit association that supports unconventional research ideas and promote the public understanding of science by making laboratory tools more accessible. The goal of BeerDeCoded is to extend scientific knowledge about beer, while discussing issues related to personal genomics, food technology, and their role in society with the general public. Two years ago, a crowdfunding campaign provided funding for the first stage of the project. Reaching out through this channel also allowed to collect 120 beer samples from 20 countries.
We have now obtained the metagenomic profiles for 39 of these beers using a targeted approach (ITS). We have demonstrated that it is possible to extract DNA directly from bottled beer using low cost methodologies available to citizen scientists. DNA sequenced from these samples identified a variety of wild yeast species in commercial beers. For example, some brews contain traces of more than 30 different fungal species. Brewing is a complex process and it is unclear if the beer microbiome can directly affect the final beer taste or texture and how it could be controlled to create beers with a specific character.

Altogether, we demonstrated that coupling simple laboratory procedures with DNA sequencing and metagenomic analysis can allow the detection of the microbial content in commercial beer and can easily trigger a tripartite conversation between the general public, the scientists and professional brewers.

## Content of the repository

-	Sup_Data folder: Preliminary analysis of the FASTQ files for 39 Beers
-	Code folder:
		The scripts that were used on the 	cluster: 
			-	mapping_Beer_to_ITS.sh
			-	BEER_DeCoded_ITS_count.sh
		R statistical analysis of the preprocessed results: 	-	
		
			-	BEER_DeCoded_ITS_count.sh
			-	Metagenomic_data_preparation.py
			-	oneCodex_output_viz.R
			-	Beer_seq.R
			
-	Preprocessed results: 
		.	BeerDecoded_seq_res_clean.csv or xlsx 

-	Sup_Data folder: Beer metadata
-	figure folder: Plots

## Raw Data

the raw data of our ITS sequencing of the 39 beers will be accessible on the SRA database bioproject [ID PRJNA388541](https://www.ncbi.nlm.nih.gov/bioproject/388541) 
