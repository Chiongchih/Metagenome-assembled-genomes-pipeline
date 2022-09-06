#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J Q210220_alaDNA
#SBATCH -o Q210220_alaDNA.%J.out
#SBATCH -e Q210220_alaDNA.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=6-00:00:00
#SBATCH --mem=200G
#SBATCH -c 16

#run the application:
module load megahit/1.2.9
#megahit -1 EJH-MT-060220-DNA_R1_paired.fastq.gz -2 EJH-MT-051120-DNA_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-051120_asm_8 -t 8
#megahit -1 EJH-MT-060220-DNA_R1_paired.fastq.gz -2 EJH-MT-051020-DNA_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-051020_asm2_8 -t 8
#megahit -1 EJH-MT-060220-DNA_R1_paired.fastq.gz -2 EJH-MT-050520-DNA_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-050520_asm2_8 -t 8
#megahit -1 EJH-MT-060220-DNA_R1_paired.fastq.gz -2 EJH-MT-050420-DNA_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-050420_asm2_8 -t 8
#megahit -1 EJH-MT-050320-DNA_R1_paired.fastq.gz -2 EJH-MT-050320-DNA_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-050320_asm2_8 -t 8
megahit -1 Q210220_R1_paired.fastq.gz -2 Q210220_R2_paired.fastq.gz -o ../Megahit_contigs/Q210220_asm -t 16 

#megahit -1 EJH-MT-042420_R1_paired.fastq.gz -2 EJH-MT-042420_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-042420_asm_r -t 4
#megahit -1 EJH-MT-042820_R1_paired.fastq.gz -2 EJH-MT-042820_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-042820_asm_r -t 4
#megahit -1 EJH-MT-051220_R1_paired.fastq.gz -2 EJH-MT-051220_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-051220_asm_r -t 4
#megahit -1 EJH-MT-052720_R1_paired.fastq.gz -2 EJH-MT-052720_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-052720_asm_r -t 4
#megahit -1 EJH-MT-061520_R1_paired.fastq.gz -2 EJH-MT-061520_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-061520_asm_r -t 4
#megahit -1 EJH-MT-062220_R1_paired.fastq.gz -2 EJH-MT-062220_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-062220_asm_r -t 4
#megahit -1 EJH-MT-070320_R1_paired.fastq.gz -2 EJH-MT-070320_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-070320_asm_16 -t 16
#megahit -1 EJH-MT-070820_R1_paired.fastq.gz -2 EJH-MT-070820_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-070820_asm_16 -t 16

