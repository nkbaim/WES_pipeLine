##data quality


for id in *1.fastq.gz
do 
cd ${id%%_*}
#Progress report
echo `date` "start do QC for " ${id%%_*}


fastqc -t 20 --noextract -o ./  *fq.gz


#Progress report
echo `date` "end do QC for " ${id%%_*}
cd ..
done 

