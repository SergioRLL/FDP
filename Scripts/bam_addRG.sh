#!/bin/sh

# Script for adding the sample names to the @RG tag in the BAM files (sammtools addreplacerg)

# SLURM HEADER
############################################
# JOB INFO
#SBATCH --account=****
#SBATCH --job-name=addRGbams
#SBATCH --mem=50G
#SBATCH --cpus-per-task=12
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sergio.rod.lla@gmail.com
#SBATCH --output=/mnt/lustre/scratch/srodriguez/log_%J.out
#SBATCH --error=/mnt/lustre/scratch/srodriguez/log_%J.err

# Loading modules

module load samtools

# Adding variables

bams=/mnt/lustre/scratch/srodriguez/data/bams
addRGbams=/mnt/lustre/scratch/srodriguez/data/addRGbams

# Code

for bin in $bams/*	
do
    bin_name="${bin##*/}"
    outbam=${addRGbams}/${bin_name}                      
    mkdir ${outbam}
    for input_bam in ${bin}/*.bam
    do
        sample="${input_bam##*/}"
        sample="${sample%.*}"
        samtools addreplacerg --threads 12 -r "ID:${sample}" -r "LB:lib1" -r "PL:illumina" -r "PU:unit1" -r "SM:${sample}" -o ${outbam}/${sample}.addRG.bam ${input_bam}
    done
done
