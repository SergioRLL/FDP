#!/bin/sh

# Script for using samtools merge to join bam files

# SLURM HEADER
############################################
# JOB INFO
#SBATCH --account=****
#SBATCH --job-name=samtools_merge
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sergio.rod.lla@gmail.com
#SBATCH --output=/mnt/lustre/scratch/srodriguez/log_%J.out
#SBATCH --error=/mnt/lustre/scratch/srodriguez/log_%J.err
#SBATCH --cpus-per-task=12

# Load the modules you'll need
module load samtools

# Declare variables (add more comments)

# Add the job...
for bin in /mnt/lustre/scratch/srodriguez/data/addRGbams/*
do
    bin_name="${bin##*/}"
    samtools merge ${bin}/${bin_name}.addRG.merged.bam ${bin}/*.bam -@ 12
done

