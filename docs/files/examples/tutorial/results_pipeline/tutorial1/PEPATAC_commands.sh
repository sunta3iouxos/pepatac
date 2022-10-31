# Pipeline started at 09-21 14:04:13

ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial1_r1.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R1.fastq.gz
ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial1_r2.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R2.fastq.gz
ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R1.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1.fastq.gz
ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R2.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2.fastq.gz
skewer -f sanger -t 4 -m pe -x /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/NexteraPE-PE.fa --quiet -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2.fastq.gz
mv /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1-trimmed-pair1.fastq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1_trim.fastq
mv /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1-trimmed-pair2.fastq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2_trim.fastq
fastqc --noextract --outdir /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastqc /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1_trim.fastq
fastqc --noextract --outdir /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastqc /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2_trim.fastq
mkfifo /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/rCRSd_bt2
perl /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/filter_paired_fq.pl /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/rCRSd_bt2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1_trim.fastq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2_trim.fastq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R1.fq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R2.fq
(bowtie2 -p 4 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/rCRSd/bowtie2_index/default/rCRSd --rg-id tutorial1 -U /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1_trim.fastq --un /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/rCRSd_bt2 > /dev/null) 2>/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_bt_aln_summary.log
grep 'aligned exactly 1 time' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_bt_aln_summary.log | awk '{print $1}'
mkfifo /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/human_repeats_bt2
perl /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/filter_paired_fq.pl /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/human_repeats_bt2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R1.fq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R2.fq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R1.fq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R2.fq
(bowtie2 -p 4 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/human_repeats/bowtie2_index/default/human_repeats --rg-id tutorial1 -U /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R1.fq --un /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/human_repeats_bt2 > /dev/null) 2>/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_bt_aln_summary.log
grep 'aligned exactly 1 time' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_bt_aln_summary.log | awk '{print $1}'
pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R1.fq
pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R2.fq
pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R1.fq
pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R2.fq
bowtie2 -p 4  --very-sensitive -X 2000 --rg-id tutorial1 -x /project/shefflab/genomes/hg38/bowtie2_index/default/hg38 -1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R1.fq.gz -2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R2.fq.gz | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tmpuh0mv4hp -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_temp.bam
samtools view -b -q 10 -@ 4 -U /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_fail_qc.bam -f 2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_temp.bam > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam
samtools index /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_temp.bam
samtools index /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam
samtools idxstats /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_temp.bam | grep -we 'chrM' -we 'ChrM' -we 'ChrMT' -we 'chrMT' -we 'M' -we 'MT' -we 'rCRSd'| cut -f 3
samtools idxstats /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam | cut -f 1-2 | awk '{print $1, 0, $2}' | grep -vwe 'chrM' -vwe 'ChrM' -vwe 'ChrMT' -vwe 'chrMT' -vwe 'M' -vwe 'MT' -vwe 'rCRSd' > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/chr_sizes.bed
samtools view -L /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/chr_sizes.bed -b -@ 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_noMT.bam
mv /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_noMT.bam /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam
samtools index /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam
/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/bamQC.py -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam -c 4 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_bamQC.tsv
awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_bamQC.tsv
awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_bamQC.tsv
awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_bamQC.tsv
samtools view -b -@ 4 -f 12  /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_temp.bam > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_unmap.bam
samtools view -c -f 4 -@ 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_temp.bam
samtools sort -n -@ 1 -T /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tmpqxlr3h_m /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam | samtools view -h - -@ 1 | samblaster -r --ignoreUnmated 2> /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_dedup_metrics_log.txt | samtools view -b - -@ 1 | samtools sort - -@ 1 -T /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tmpqxlr3h_m -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam
samtools index /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam
grep 'Removed' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_dedup_metrics_log.txt | tr -s ' ' | cut -f 3 -d ' '
samtools stats /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam | grep '^SN' | cut -f 2- | grep 'maximum length:' | cut -f 2-
awk '{sum+=$2} END {printf "%.0f", sum}' /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes
preseq c_curve -v -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_out.txt -B /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam
preseq lc_extrap -v -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_yield.txt -B /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam
echo '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_yield.txt '$(samtools view -c -F 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam)' '$(samtools view -c -F 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam) > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_counts.txt
Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R preseq -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_yield.txt -r /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_counts.txt -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_plot
grep -w '^10000000' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_yield.txt | awk '{print $2}'
/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/bamSitesToWig.py -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes -e /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_shift.bed -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_exact.bw -w /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_smooth.bw -m atac -p 2 --variable-step --scale 876940.0
/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/pyTssEnrichment.py -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -b /project/shefflab/genomes/hg38/refgene_anno/default/hg38_TSS.bed -p ends -c 4 -z -v -s 6 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_TSS_enrichment.txt
Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R tss -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_TSS_enrichment.txt
perl /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/fragment_length_dist.pl /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLen.txt
sort -n  /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLen.txt | uniq -c  > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragCount.txt
Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R frag -l /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLen.txt -c /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragCount.txt -p /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLenDistribution.pdf -t /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLenDistribution.txt
ln -sf /project/shefflab/genomes/hg38/feat_annotation/default/hg38_annotations.bed.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed.gz
pigz -f -p 4 -d -c /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed.gz > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed
macs2 callpeak -t /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_shift.bed -f BED --outdir /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38 -n tutorial1 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01
pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_shift.bed > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_shift.bed.gz
awk -v OFS='	' '{$2 = int(($3 - $2)/2 + $2 - 250); $3 = int($2 + 500); print}' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks.narrowPeak > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_fixedWidth.narrowPeak
Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R reduce -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_fixedWidth.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes --normalize
ln -sf /project/shefflab/genomes/hg38/blacklist/default/hg38_blacklist.bed.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_blacklist.bed.gz
pigz -f -p 4 -d -c /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_blacklist.bed.gz > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_blacklist.bed
bedtools intersect -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_blacklist.bed -v > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_rmBlacklist.narrowPeak
Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R reduce -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_rmBlacklist.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes
touch /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/blacklist.flag
samtools view -@ 4 -c -L /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam
samtools view -H /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt
cut -f 1-3 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks.bed
samtools view -H /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt
cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_keep.txt
bedtools sort -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks.bed -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_sort.bed
bedtools coverage -sorted -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | uniq > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed
awk 'BEGIN{OFS="\t";} NR==FNR{sum += $5; next}{if (sum <= 0){sum = 1} print $1, $2, $3, $4, $5, $6, $7, ($5/sum*1000000)}' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_norm_peaks_coverage.bed
mv /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_norm_peaks_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed
touch /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/coverage.flag
pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed.gz
echo 'table bigNarrowPeak
"BED6+4 Peaks of signal enrichment based on pooled, normalized (interpreted) data."
(
     string chrom;        "Reference sequence chromosome or scaffold"
     uint   chromStart;   "Start position in chromosome"
     uint   chromEnd;     "End position in chromosome"
     string name;         "Name given to a region (preferably unique). Use . if no name is assigned"
     uint   score;        "Indicates how dark the peak will be displayed in the browser (0-1000) "
     char[1]  strand;     "+ or - or . for unknown"
     float  signalValue;  "Measurement of average enrichment for the region"
     float  pValue;       "Statistical significance of signal value (-log10). Set to -1 if not used."
     float  qValue;       "Statistical significance with multiple-test correction applied (FDR -log10). Set to -1 if not used."
     int   peak;          "Point-source called for this peak; 0-based offset from chromStart. Set to -1 if no point-source called."
)' > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/bigNarrowPeak.as
bedToBigBed -as=/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/bigNarrowPeak.as -type=bed6+4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tmp85spiubq /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks.bigBed
Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R anno -p chromosome -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak -f /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed -g hg38 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_chromosome_distribution.pdf
Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R anno -p tss -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak -f /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed -g hg38 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_TSS_distribution.pdf
Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R anno -p genomic -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak -f /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed -g hg38 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_genomic_distribution.pdf
cut -f 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed | sort -u
awk -F'	' '{print>"/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/"$4}' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed
mv "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3' UTR" "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3_UTR"
cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3_UTR | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3_UTR_sort.bed
bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3_UTR_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_3_UTR_coverage.bed
mv "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5' UTR" "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5_UTR"
cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5_UTR | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5_UTR_sort.bed
bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5_UTR_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_5_UTR_coverage.bed
cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Enhancer | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Enhancer_sort.bed
bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Enhancer_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Enhancer_coverage.bed
cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Exon | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Exon_sort.bed
bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Exon_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Exon_coverage.bed
cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Intron | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Intron_sort.bed
bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Intron_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Intron_coverage.bed
cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_sort.bed
bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_coverage.bed
mv "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter Flanking Region" "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_Flanking_Region"
cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_Flanking_Region | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_Flanking_Region_sort.bed
bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_Flanking_Region_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_Flanking_Region_coverage.bed
samtools view -@ 4 -q 10 -c -F4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam
Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R frif -s tutorial1 -z 3099922541 -n 876930 -y cfrif --reads -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_cFRiF.pdf --bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_3_UTR_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_5_UTR_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Enhancer_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Exon_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Intron_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_Flanking_Region_coverage.bed
Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R frif -s tutorial1 -z 3099922541 -n 876930 -y frif --reads -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_FRiF.pdf --bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_3_UTR_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_5_UTR_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Enhancer_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Exon_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Intron_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_Flanking_Region_coverage.bed
