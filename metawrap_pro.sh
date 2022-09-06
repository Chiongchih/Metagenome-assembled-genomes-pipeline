#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J MRQ210123
#SBATCH -o MRQ210123.%J.out
#SBATCH -e MRQ210123.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=24:00:00
#SBATCH --mem=100G
#SBATCH -c 64


#run the application:
module load samtools/1.8
module load bowtie2/2.3.5
module load metawrap/1.3
module load miniconda3/4.7.12.1
source activate anvio-7

filename="Q210123"
anvi-script-reformat-fasta ../Megahit_contigs/"$filename"_asm/final.contigs.fa -o ../Megahit_contigs/"$filename"_asm/"$filename".reformat_contigs.fa -l 1000 --simplify-names
gunzip ../Trim_output/"$filename"_paired_1.fastq.gz
gunzip ../Trim_output/"$filename"_paired_2.fastq.gz
metawrap binning -o "$filename"_metawrap -t 64 -a ../Megahit_contigs/"$filename"_asm/"$filename".reformat_contigs.fa --metabat2 --maxbin2 --concoct ../Trim_output/"$filename"_*.fastq
gzip ../Trim_output/"$filename"_paired_1.fastq
gzip ../Trim_output/"$filename"_paired_2.fastq
metawrap bin_refinement -o "$filename"_metawrap_refine -t 64 -A ./"$filename"_metawrap/metabat2_bins/ -B ./"$filename"_metawrap/maxbin2_bins/ -C ./"$filename"_metawrap/concoct_bins/ -c 70 -x 10


