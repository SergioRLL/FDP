#!/bin/sh

# Script for preparing custom GFF files to be used in VEP

# SLURM HEADER
############################################
# JOB INFO
#SBATCH --account=****
#SBATCH --job-name=CustomGFF
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sergio.rod.lla@gmail.com
#SBATCH --output=/mnt/lustre/scratch/srodriguez/log_%J.out
#SBATCH --error=/mnt/lustre/scratch/srodriguez/log_%J.err

# Load the modules you'll need
module load miniconda
source /home/apps/miniconda/4.5.x/etc/profile.d/conda.sh
conda activate eukulele-1.0.4

# Variables
gffs=/mnt/lustre/scratch/srodriguez/data/genes_annotated

# Code
for gff in ${gffs}/*.gff
do
    grep -v "#" ${gff} | sort -k1,1 -k4,4n -k5,5n -t$'\t' | bgzip -c > ${gff}.gz
    tabix -p gff ${gff}.gz
done
