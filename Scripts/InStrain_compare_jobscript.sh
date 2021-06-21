#!/bin/sh

# Script for using inStrain compare

# SLURM HEADER
############################################
# JOB INFO
#SBATCH --account=****
#SBATCH --job-name=inStrain_compare
#SBATCH --mem=50G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sergio.rod.lla@gmail.com
#SBATCH --output=/mnt/lustre/scratch/srodriguez/log_%J.out
#SBATCH --error=/mnt/lustre/scratch/srodriguez/log_%J.err

# Load the modules you'll need
module load python/3.8.5 samtools

# Declare variables (add more comments)
profiles=/home/srodriguez/srodriguez/InStrain_analyses/joint_genomes_1.5.1
stb_file=/mnt/lustre/scratch/srodriguez/data/genomes.stb

# Add the job...

inStrain compare -i $profiles/* -s $stb_file -p 6 -o ~/srodriguez/InStrain_analyses/joint_genomes_1.5.1.IS.COMPARE --database_mode
