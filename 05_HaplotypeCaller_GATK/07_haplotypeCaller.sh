##
reference=/home/ref/hg19/gatk/ucsc.hg19.fasta

for i in *1.fastq.gz
do
cd ${i%%_*}

#Progress report
echo "Sample " ${i%%_*} " HaplotypeCaller"

java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
	-T HaplotypeCaller \
	-R $reference \
	-I ${i%%_*}_recal_reads.bam \
	-o ${i%%_*}_raw_variants.vcf
cd ..
done 
