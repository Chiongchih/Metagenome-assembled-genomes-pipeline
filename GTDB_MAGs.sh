#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J GTA200801
#SBATCH -o GTA200801.%J.out
#SBATCH -e GTA200801.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=8:00:00
#SBATCH --mem=300G

#run the application:
filename="A200801"
#MAGs for GTDB must ended by .fna
module load gtdb-tk/1.3.0/python3.6
export GTDBTK_DATA_PATH=/ibex/scratch/wangc0c/My_Tools/GTDB_dt/release95
for f in ./"$filename"_metawrap_refine/metawrap_70_10_bins/*.fa; do mv -- "$f" "${f%.fa}.fna"; done
gtdbtk classify_wf --genome_dir ./"$filename"_metawrap_refine/metawrap_70_10_bins/ --out_dir "$filename"_GTDB/
for f in ./"$filename"_metawrap_refine/metawrap_70_10_bins/*.fna; do mv -- "$f" "${f%.fna}.fa"; done
