# Pipeline started at 09-14 14:34:14

ln -sf /project/shefflab/data/sra_fastq//SRR5210450_1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R1.fastq.gz
ln -sf /project/shefflab/data/sra_fastq//SRR5210450_2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R2.fastq.gz
ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1.fastq.gz
ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2.fastq.gz
skewer -f sanger -t 32 -m pe -x /scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2.fastq.gz
mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2-trimmed-pair1.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1_trim.fastq
mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2-trimmed-pair2.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2_trim.fastq
fastqc --noextract --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastqc /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1_trim.fastq
fastqc --noextract --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastqc /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2_trim.fastq
mkfifo /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/rCRSd_bt2
perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/rCRSd_bt2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1_trim.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2_trim.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R2.fq
(bowtie2 -p 32 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/rCRSd/bowtie2_index/default/rCRSd --rg-id gold2 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1_trim.fastq --un /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/rCRSd_bt2 > /dev/null) 2>/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_bt_aln_summary.log
grep 'aligned exactly 1 time' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_bt_aln_summary.log | awk '{print $1}'
mkfifo /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/human_repeats_bt2
perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/human_repeats_bt2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R2.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R2.fq
(bowtie2 -p 32 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/human_repeats/bowtie2_index/default/human_repeats --rg-id gold2 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R1.fq --un /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/human_repeats_bt2 > /dev/null) 2>/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_bt_aln_summary.log
grep 'aligned exactly 1 time' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_bt_aln_summary.log | awk '{print $1}'
pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R1.fq
pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R2.fq
pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R1.fq
pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R2.fq
bowtie2 -p 32  --very-sensitive -X 2000 --rg-id gold2 -x /project/shefflab/genomes/hg38/bowtie2_index/default/hg38 -1 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R1.fq.gz -2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R2.fq.gz | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/tmpywkp7_bu -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam
samtools view -b -q 10 -@ 32 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_fail_qc.bam -f 2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam
samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam
samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam
samtools idxstats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam | grep -we 'chrM' -we 'ChrM' -we 'ChrMT' -we 'chrMT' -we 'M' -we 'MT' -we 'rCRSd'| cut -f 3
samtools idxstats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam | cut -f 1-2 | awk '{print $1, 0, $2}' | grep -vwe 'chrM' -vwe 'ChrM' -vwe 'ChrMT' -vwe 'chrMT' -vwe 'M' -vwe 'MT' -vwe 'rCRSd' > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/chr_sizes.bed
samtools view -L /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/chr_sizes.bed -b -@ 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_noMT.bam
mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_noMT.bam /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam
samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam
/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam -c 32 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_bamQC.tsv
awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_bamQC.tsv
awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_bamQC.tsv
awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_bamQC.tsv
samtools view -b -@ 32 -f 12  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_unmap.bam
samtools view -c -f 4 -@ 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam
samtools sort -n -@ 8 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/tmptrcdrhev /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam | samtools view -h - -@ 8 | samblaster -r --ignoreUnmated 2> /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_dedup_metrics_log.txt | samtools view -b - -@ 8 | samtools sort - -@ 8 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/tmptrcdrhev -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam
samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam
grep 'Removed' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_dedup_metrics_log.txt | tr -s ' ' | cut -f 3 -d ' '
samtools stats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam | grep '^SN' | cut -f 2- | grep 'maximum length:' | cut -f 2-
awk '{sum+=$2} END {printf "%.0f", sum}' /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes
preseq c_curve -v -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_out.txt -B /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam
preseq lc_extrap -v -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_yield.txt -B /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam
echo '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_yield.txt '$(samtools view -c -F 4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam)' '$(samtools view -c -F 4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam) > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_counts.txt
Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R preseq -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_yield.txt -r /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_counts.txt -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_plot
grep -w '^10000000' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_yield.txt | awk '{print $2}'
/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes -e /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact -b /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_shift.bed -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_exact.bw -w /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_smooth.bw -m atac -p 21 --variable-step --scale 14945152.0
/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam -b /project/shefflab/genomes/hg38/refgene_anno/default/hg38_TSS.bed -p ends -c 32 -z -v -s 6 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_TSS_enrichment.txt
Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R tss -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_TSS_enrichment.txt
perl /scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragLen.txt
sort -n  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragLen.txt | uniq -c  > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragCount.txt
Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R frag -l /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragLen.txt -c /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragCount.txt -p /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragLenDistribution.pdf -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragLenDistribution.txt
ln -sf /project/shefflab/genomes/hg38/feat_annotation/default/hg38_annotations.bed.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/hg38_annotations.bed.gz
pigz -f -p 32 -d -c /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/hg38_annotations.bed.gz > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/hg38_annotations.bed
macs2 callpeak -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_shift.bed -f BED --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38 -n gold2 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01
pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_shift.bed > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_shift.bed.gz
awk -v OFS='	' '{$2 = int(($3 - $2)/2 + $2 - 250); $3 = int($2 + 500); print}' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38/gold2_peaks.narrowPeak > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38/gold2_peaks_fixedWidth.narrowPeak
Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R reduce -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38/gold2_peaks_fixedWidth.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes --normalize
