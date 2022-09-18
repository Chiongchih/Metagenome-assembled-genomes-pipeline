#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J rgi-EC
#SBATCH -o rgi-EC.%J.out
#SBATCH -e rgi-EC.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=3-00:00:00
#SBATCH --mem=30G
#SBATCH -c 16

#run the application:
#filename="062720"
#module load gtdb-tk/1.0.2/python3.6
module load miniconda3/4.7.12.1
source activate rgi
rgi load --card_json /home/wangc0c/Tools/CARD_rgi/card.json --local
for i in *.fa
do
rgi main --input_sequence "$i" --output_file "$i".rgi.output --input_type contig --local --clean -n 16
done
