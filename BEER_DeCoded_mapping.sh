#!/bin/bash

#BSUB -L /bin/bash
#BSUB -o bwa.txt
#BSUB -e bwa.err
#BSUB -N
#BUSB -u jonathan.sobel@unil.ch
#BSUB -R rusage[mem=32000]
#BSUB -M 32000000

#### BEER DeCoded Analysis #####

module add UHTS/Aligner/bwa/0.7.13;

#bwa index ITS_sequence.fa

bwa mem ITS_sequence.fa A3_L1_R1_001_MgesuP4Xs67c.fastq A3_L1_R2_001_ZUISAwK76C6Q.fastq > Ambree_des_Brigands_du_Jorat.sam
bwa mem ITS_sequence.fa A8_L1_R1_001_OFPVq8R2ClSc.fastq A8_L1_R2_001_5u8BIOwO2zdD.fastq > La_Salamandre.sam
bwa mem ITS_sequence.fa B2_L1_R1_001_HzJuBGeNKeG4.fastq B2_L1_R2_001_oGsnV4nnt3LN.fastq > Chimay_Red_Cap.sam
bwa mem ITS_sequence.fa B8_L1_R1_001_wVHz3hgRIAWF.fastq B8_L1_R2_001_QSUxW2fWys5S.fastq > Delirium_Tremens.sam
bwa mem ITS_sequence.fa D10_L1_R1_001_ZsYxL2KxmjM0.fastq D10_L1_R2_001_ZV6xR8lgNXV0.fastq > Trois_Dames.sam
bwa mem ITS_sequence.fa D4_L1_R1_001_iRHOO0aRz0dm.fastq D4_L1_R2_001_RTndaqie5ksg.fastq > Orval.sam
bwa mem ITS_sequence.fa E1_L1_R1_001_YqbmW0mxDb8H.fastq E1_L1_R2_001_vwBKck9etkN3.fastq > La_cotta_bionda.sam
bwa mem ITS_sequence.fa E2_L1_R1_001_rt6Hhbyxg9ij.fastq E2_L1_R2_001_zIV5xpgD9a5C.fastq > Hoppy_Couple.sam
bwa mem ITS_sequence.fa E3_L1_R1_001_TSZL9LwLK3h5.fastq E3_L1_R2_001_bj0jsT0WZKYZ.fastq > Waldbier_2014_Wienerwald.sam
bwa mem ITS_sequence.fa E6_L1_R1_001_w8txmj5PubFD.fastq E6_L1_R2_001_VMzn9NZKKgmV.fastq > Valaisanne_Amrich.sam
bwa mem ITS_sequence.fa E7_L1_R1_001_xOr6hEsI6UEw.fastq E7_L1_R2_001_hlC5R2TqOsJT.fastq > Brasserie_Gessienne_Blanche.sam
bwa mem ITS_sequence.fa E8_L1_R1_001_trAyfJUZfRMK.fastq E8_L1_R2_001_85tV90v4Ww0J.fastq > Mateo_21.sam
bwa mem ITS_sequence.fa F10_L1_R1_001_W5xpH4V8mdUX.fastq F10_L1_R2_001_N9bsqBtjg2vp.fastq > Docteur_Gabs_Pepite.sam
bwa mem ITS_sequence.fa F11_L1_R1_001_EK38QxMbh0M8.fastq F11_L1_R2_001_7LGYKtjLJr1T.fastq > Docteur_Gabs_Tempete.sam
bwa mem ITS_sequence.fa F12_L1_R1_001_EyD0vyjedVty.fastq F12_L1_R2_001_m072jMC93fUg.fastq > La_Nebuleuse_Embuscade.sam
bwa mem ITS_sequence.fa F3_L1_R1_001_ftmxFnWb4sOi.fastq F3_L1_R2_001_iq6mp9BVfMcx.fastq > Hackuarium_Fakufaku.sam
bwa mem ITS_sequence.fa F4_L1_R1_001_ItcORWeiy7hz.fastq F4_L1_R2_001_weqhE8Nr83Dn.fastq > Calvinus_Blanche.sam
bwa mem ITS_sequence.fa F7_L1_R1_001_eUN9Cu6sGIY4.fastq F7_L1_R2_001_QnlGtJxBZhF0.fastq > Les_Muraille_Pieuse.sam
bwa mem ITS_sequence.fa F8_L1_R1_001_sim9LijYCWIZ.fastq F8_L1_R2_001_Qq18hGq0pevP.fastq > Homebrew_Roter_Baron.sam
bwa mem ITS_sequence.fa F9_L1_R1_001_A51CqePFObTs.fastq F9_L1_R2_001_Fnopb1g1Atuj.fastq > Docteur_Gabs_Houleuse.sam
bwa mem ITS_sequence.fa G10_L1_R1_001_pIg5E0JmlSNY.fastq G10_L1_R2_001_PEitWzGSlvfL.fastq > Coudres_Pale_Ale.sam
bwa mem ITS_sequence.fa G11_L1_R1_001_Q5YdSOyCOXAq.fastq G11_L1_R2_001_qtaqVhOYkyQe.fastq > Homebrew_Amber_Ale.sam
bwa mem ITS_sequence.fa G12_L1_R1_001_gQQGvSl907PM.fastq G12_L1_R2_001_jtQGUY0qvFVH.fastq > Homebrew_SquareBeer.sam
bwa mem ITS_sequence.fa G1_L1_R1_001_ZNPFvYudKxDk.fastq G1_L1_R2_001_Bhw4rU1PhDKM.fastq > La_Nebuleuse_Malt_Capone.sam
bwa mem ITS_sequence.fa G2_L1_R1_001_WQBPYbB6miGZ.fastq G2_L1_R2_001_xiqxobQS8oi7.fastq > La_Nebuleuse_Stirling.sam
bwa mem ITS_sequence.fa G3_L1_R1_001_iT1ByYMLevfD.fastq G3_L1_R2_001_nCY0Y41ugn7f.fastq > Bieraria_Tschlin_BE.sam
bwa mem ITS_sequence.fa G5_L1_R1_001_TGIH0DRns3ja.fastq G5_L1_R2_001_mfv1eCowmoSx.fastq > Chimay_Tripel.sam
bwa mem ITS_sequence.fa G9_L1_R1_001_nPPEtRVDvw0g.fastq G9_L1_R2_001_Wd3C7jMwY1Zd.fastq > Brasserie_DuPont_BioLegere.sam
bwa mem ITS_sequence.fa H10_L1_R1_001_xDnHPQhJWfVv.fastq H10_L1_R2_001_WNT3mDBSYdDy.fastq > Brasserie_dAyent_Celsius_Folamour.sam 
bwa mem ITS_sequence.fa H11_L1_R1_001_VW2KrYAtJt1k.fastq H11_L1_R2_001_l0pMeSKIlA4I.fastq > Coudres_Blonde.sam
bwa mem ITS_sequence.fa H12_L1_R1_001_FHKZhmvYZpMr.fastq H12_L1_R2_001_PTUVu91LpbKs.fastq > La_Nebuleuse_ChichaBeer_experimental.sam
bwa mem ITS_sequence.fa H1_L1_R1_001_UUq2PGvLMjab.fastq H1_L1_R2_001_SuA76d4FVFaW.fastq > La_Mule_Browney.sam
bwa mem ITS_sequence.fa H3_L1_R1_001_bkQWCbm23tC9.fastq H3_L1_R2_001_XGtpZGjJ5tEa.fastq > La_Montheysanne.sam
bwa mem ITS_sequence.fa H4_L1_R1_001_9Jgn1F3tymdQ.fastq H4_L1_R2_001_vozgWJeaIIA4.fastq > Brasserie_du_Griffon_La_Fourbe.sam
bwa mem ITS_sequence.fa H5_L1_R1_001_InPvznyCYBVx.fastq H5_L1_R2_001_bjHbKJfjEBNn.fastq > Brasserie_Sierrvoise_Noire.sam
bwa mem ITS_sequence.fa H6_L1_R1_001_bF11yKQcEg8z.fastq H6_L1_R2_001_BHs6zfH19BK1.fastq > Brasseurs_de_Volleges_La_Tourbillon.sam
bwa mem ITS_sequence.fa H7_L1_R1_001_9SOCyXOySopy.fastq H7_L1_R2_001_Xxm87tgVZeTj.fastq > Brasserie_du_Vieux_Chemin_La_Prudencia.sam
bwa mem ITS_sequence.fa H8_L1_R1_001_gjdNgjEsKu2v.fastq H8_L1_R2_001_dYkn9HTEtlda.fastq > Brasserie_Tardiv.sam
bwa mem ITS_sequence.fa H9_L1_R1_001_eUOKzBCeIUIK.fastq H9_L1_R2_001_c0sfVrAkbKUo.fastq > Brasserie_des_5_quatre_mille_Biere_de_Zinal.sam

module add UHTS/Analysis/samtools/1.3;

for i in $( ls *.sam)
do
	SUBSTRING=$(echo $i| cut -d'.' -f 1)
	samtools view -bS $i > $SUBSTRING.bam
	samtools sort $SUBSTRING.bam > ${SUBSTRING}_sorted.bam
	samtools index ${SUBSTRING}_sorted.bam
done

touch Beer_lib_sizes.txt

for j in $( ls *sorted.bam)
do
	count=$(samtools view -c $j)
	echo "$j $count" >> Beer_lib_sizes.txt
done



