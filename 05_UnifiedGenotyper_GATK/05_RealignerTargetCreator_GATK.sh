##
reference=/home/ref/hg19/gatk/ucsc.hg19.fasta
bedFile=$1
for i in *1.fastq.gz
do
cd ${i%%_*}

#Progress report
echo "Sample " ${i%%_*} " RealignerTargetCreator"

java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
-T RealignerTargetCreator \
-R $reference \
-L $bedFile \
-I ${i%%_*}_remove_duplicates.bam \
-known /home/database/gatk/dbsnp_138.hg19.vcf \
-known /home/database/gatk/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf \
--fix_misencoded_quality_scores \
-o ${i%%_*}_realigner.intervals
cd ..
done 
