#!/bin/bash

#BSUB -L /bin/bash
#BSUB -o bwa.txt
#BSUB -e bwa.err
#BSUB -N
#BUSB -u jonathan.sobel@unil.ch
#BSUB -R rusage[mem=32000]
#BSUB -M 32000000

####BeerDecoded ITS Count per beers####

module add UHTS/Analysis/samtools/1.3;

for i in $( ls *_sorted.bam)
do
	SUBSTRING=$(echo $i| cut -d'.' -f 1)
	echo $SUBSTRING
	samtools view $i|cut -f 3|sort|uniq -c|sed 's/|/ /g'|awk -v beer="$SUBSTRING" '{print $1, $5, beer}'| sort -n -r |sed 's/_sorted//g' >> Beer_results_all.txt	
done
      
grep '>' ITS_sequence.fa| cut -d '|' -f 4,5|sed 's/; from TYPE material//g' > species_ID_mapping.txt