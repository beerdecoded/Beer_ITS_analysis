#!/usr/bin/python

#Data preparation

#file = open('beer_132.txt', 'r')
#print file.read(5)

#with open("beer_132.txt") as input:
 #   print zip(*(line.strip().split('\t') for line in input))

import os
import json
import csv
import ast


f = open('beer_132.txt', 'r')

for line in f.readlines():

	beer=line.split("\t")[0]+"_"

	cmd =' '.join(['grep','-A 3', beer, '132_seqs.fastq','>',beer+"sample.fastq"])
	#os.system(cmd)
	print cmd
f.close()
#### dict usage ####
#tel = {'jack': 4098, 'sape': 4139}
#ONE CODEX pipeline

cmd="export ONE_CODEX_API_KEY='API_KEY'"
print cmd
os.system(cmd)

stream = os.popen('ls *sample.fastq').read().splitlines() #read()
for x in stream:
    cmd="curl https://beta.onecodex.com/api/v0/upload -X POST -u $ONE_CODEX_API_KEY: --form filename=@%s" % (x)
    print cmd
    os.system(cmd)
    
#curl https://beta.onecodex.com/api/v0/ -u $ONE_CODEX_API_KEY

#curl https://beta.onecodex.com/api/v0/upload -X POST -u $ONE_CODEX_API_KEY: --form filename=@sample.fasta

#cmd="%s\n%s\n%s%s\n%s" % ("for j in $(ls *sample.fastq)","do","echo 'onecodex upload'", "$j","done")
#print cmd
#os.system(cmd)

#
#for j in $(ls *sample.fastq)
#do
#onecodex upload $j
#done


output_ref="curl https://beta.onecodex.com/api/v0/samples -u $ONE_CODEX_API_KEY: > samples.json"

os.system(output_ref)
#data = []


with open("samples.json") as file:
    data = json.load(file)

#print data
with open("samples.csv", "w") as file:
    csv_file = csv.writer(file)
    csv_file.writerow(['id', 'filename'])
    for item in data:
       csv_file.writerow([item['id'], item['filename']])


output_ref="curl https://beta.onecodex.com/api/v0/analyses -u $ONE_CODEX_API_KEY:  > OneCodexAnalyses.json"
os.system(output_ref)

with open("OneCodexAnalyses.json") as file:
    data = json.load(file)

#print data
with open("OneCodexAnalyses.csv", "w") as file:
    csv_file = csv.writer(file)
    csv_file.writerow(["id", "sample_filename", "reference_id","sample_id"])
    for item in data:
       csv_file.writerow([item['id'], item['sample_filename'],item['reference_id'],item['sample_id']])

f = open('OneCodexAnalyses.csv', 'r')

#convert_json_tax('10105.beer.102_sample.fastq.json')

for line in f.readlines():

    beer=line.split(",")[0]
    fnam=line.split(",")[1]

    cmd =' '.join(['curl','https://beta.onecodex.com/api/v0/analyses/'+beer+'/table', '-u','$ONE_CODEX_API_KEY:','>',fnam+'.json'])
    os.system(cmd)
    print cmd
    print fnam+'.json'
    #convert_json_tax(fnam+'.json')

    
f.close()

def convert_json_tax(file_name):
    with open(file_name) as file:
        data = json.load(file)
        print data
        with open(file_name+'.csv', "w") as file:
            csv_file = csv.writer(file)
            csv_file.writerow(['tax_id', 'rank', 'name','readcount'])
            for item in data:
                csv_file.writerow([item['tax_id'],item['rank'],item['name'],item['readcount']])

convert_json_tax('10105.beer.102_sample.fastq.json')

cmd="ls *sample.fastq.json >list_json.txt"
os.system(cmd)
print cmd


f = open('list_json.txt', 'r')

for line in f.readlines():
    convert_json_tax(line.rstrip('\n'))
f.close()


#curl https://beta.onecodex.com/api/v0/analyses/753bb3d067c048af/table -u $ONE_CODEX_API_KEY: 

#{
#"name": "Mycobacterium abscessus", 
   # "rank": "species", 
  #  "readcount": 956, 
 #   "tax_id": 36809
#    }

#p = os.popen(output_ref,"r")
#while 1:
 #   line = p.readline()
  #  data=ast.literal_eval(line)
    #print line
    #data.append(json.loads(line))
   # print data
    #print line
    #if not line: break
    #print "================"

#print data
#print line['id']
#curl https://beta.onecodex.com/api/v0/analyses -u $ONE_CODEX_API_KEY: 
#curl https://beta.onecodex.com/api/v0/analyses/753bb3d067c048af/table -u $ONE_CODEX_API_KEY: 

#curl -L https://beta.onecodex.com/api/v0/analyses/753bb3d067c048af/raw -u $ONE_CODEX_API_KEY: > sample.fasta.results.tsv.gz




