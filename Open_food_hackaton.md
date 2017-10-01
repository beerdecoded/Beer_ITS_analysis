![alt text](https://raw.githubusercontent.com/BeerDecodedProject/beer-data/master/assets/logo.png)

# Food Open Data - BeerDeCoded

Address to this document: http://bit.ly/2lree0f

## TEAM

* Jonathan Sobel: Bioinfo, Science
* Gianpaolo Rando: Science
* Xavier Stouder : IT Student, full-stack developer
* Jonny Hofmann : IT Student full-stack developer
* Christophe Penot: Marketing
* Sébastien Martin: IT Student and graphic designer
* Nolan Rigo: IT Student (Web Developer)
* Ronald Rodriguez: Chemist
* Luc Patiny: Chemist, Data viz


## What is BeerDeCoded?

At [BeerDeCoded](http://www.genome.beer) we map beer at molecular level to help brewers and beer passionates to make more informed decisions.

We want to create a molecular tree of beers that links beers with similar properties. Akin to a fingerprint, this open information could be used for B2B and B2C projects. For instance, BeerDeCoded will help craft brewers benchmark new recipes against existing products and control their quality.
Also, the data could train a deep learning sommelier to help beer passionates to discover new beers.

##Repository:
https://github.com/BeerDecodedProject

##Existing Data

We have access to the following datasets:

* List of 240+ Swiss-German Beers [google sheets](https://docs.google.com/spreadsheets/d/1Jfi2gq5apqLrvZb8d8ogpAY86b-2EbPeUmVe8z1BJVs/edit?usp=sharing): %Alcohol, Bitternes, . 
* Brewing recipes of 200+ BrewDog beers [API, Json](https://punkapi.com/).
* Untappd social drinking network (max 100 calls per hours) : [API](https://untappd.com/api/docs)
* Beer rating website : [API](https://www.ratebeer.com/json/ratebeer-api.asp)

##Fresh Data at the Hackathon
We collected real samples of 118 Beers, crowdsourced from 20 countries [tab-separated-values](https://github.com/BeerDecodedProject/beer-data/blob/master/Database_BeerBank_BeerDeCoded%20-%20Raman.tsv).
![alt text](https://raw.githubusercontent.com/BeerDecodedProject/beer-data/master/assets/data.png)

We borrowed from the Criminology Department a portable molecular scanner and at the Hackathon we scanned all the 118 beers creating a brand new open [molecular dataset](https://github.com/BeerDecodedProject/beer-data/blob/master/Raman-spectrum.zip) for the beer chemical profiles.

![alt text](https://raw.githubusercontent.com/BeerDecodedProject/beer-data/master/assets/spectrometer_exemple.png)

Model: First Defender RMX from Thermo Scientific [product page](https://www.thermofisher.com/order/catalog/product/FIRSTDEFENDERRMX)
A Raman Spectrometer used by the police to identify chemical substances (i.e. explosives, drugs) using [Raman spectroscopy](https://en.wikipedia.org/wiki/Raman_spectroscopy)

![alt text](https://raw.githubusercontent.com/BeerDecodedProject/beer-data/master/assets/spectrometer.png)
Luc Patiny (EPFL) worked on a webpage to visualise and compare the spectra. Required: Google Chrome [online demo](http://www.cheminfo.org/Spectra/IR/First_Defender/index.html). 

![alt text](https://raw.githubusercontent.com/BeerDecodedProject/beer-data/master/assets/spectrum.png)

###Page features:

* There is now the colored spectrum 'covariance' that show in red the parts of the spectrum that change the more from one to another
* It also calculates the similarity matrix (just double click on it if it does not appear). Click on the similarity matrix will show you the 2 spectra for the corresponding pixel.
* There is also the 'Clustering' button that allows to display result of hierarchical clustering.

There are traces of the food additive Potassium nitrite (E249, a preservative). In one beer we also found traces of an herbicide.

##The tree of beers
We grouped beers with similar molecular profiles into a “tree”.

![alt text](https://raw.githubusercontent.com/BeerDecodedProject/beer-data/master/assets/tree.png)

This dendrogram put beers with similar profiles into different groups (branches). Give us your feedback.
![alt text](https://raw.githubusercontent.com/BeerDecodedProject/beer-data/master/assets/stage.png)

##Typical questions with a molecular answer:

###B2C - Molecular Sommelier App
Pick a beer you like and see what else is on the branch. Try one beer. Do you like it? Stay close to your comfort zone. Wander away a few branches for something new. Feeling adventurous? Try something on the polar opposite side of the tree.

###B2B - Raw material compliance
Is this yeast, hops, wheat or barley really what my provider says it is.
Does it contain GMO? Pesticides?

###B2B - Food safety
Does my product contain harmful or undesirable microbial contaminants?
Does it contain an allergen?
Who introduced the contaminant, my production site or my subcontractor?
What is the shelf life of this beer?

###B2B - Competitor mapping
Does my competitor use my proprietary yeast strain?
How does my home-brew beer compare to benchmarks or known brands?


## The Beer Market

There are about 20,000 different beer brands on the global market. And the market for craft beers is experiencing a tremendous expansion. In the USA alone, there were more than 1,800 microbreweries in 2014 (+ 27.8% when compared with the previous year) and there are more than 6,000 in Europe and more than 600 only in Switzerland. To differentiate themselves, microbreweries continuously experiment and create new recipes, contributing to as many as 1M of different beer lots brewed every year. This explosion of variety and complexity means that both brewers and consumers face major challenges.

##Business Brainstorm:
Who is consuming what? Beer is second after wine!
Segmentation of the consumers? Profile utilisateur (as perspectives)
Think Mobile First !

###Objectives: 

* Be able to consult our Beer database on a smartphone
* Be able to compare the prices and order your favorite beer
For inspiration: the Ten rules of simplicity (John Maeda)

### Segmentation of the database: 
* Fermentation process
* Origin of Beers
* IBU, % alcohol, …

### Legal question: 

* personal data protection
* copyright of beers stickers

### Consumers segmentation:

* Age
* Sex
* Taste
* opinion

##Data modeling and database engine
The database engine will be RethinkDB. NoSQL advantages + join functionnalities.

![alt text](https://raw.githubusercontent.com/BeerDecodedProject/beer-data/master/assets/model.png)
