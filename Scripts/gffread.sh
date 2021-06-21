#!/bin/sh

# Script for using gffread to convert gff files to gtf

# SLURM HEADER
############################################
# JOB INFO
#SBATCH --account=****
#SBATCH --job-name=gffread
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sergio.rod.lla@gmail.com
#SBATCH --output=/mnt/lustre/scratch/srodriguez/log_%J.out
#SBATCH --error=/mnt/lustre/scratch/srodriguez/log_%J.err

# Adding variables
gff_files=/mnt/lustre/scratch/srodriguez/data/genes_annotated
gffread=/home/srodriguez/srodriguez/gffread/gffread/gffread

# Code
for gff in ${gff_files}/*.gff
do
    bin="${gff##*/}"
    bin="${bin%%.*}"
    ${gffread} ${gff} -T -o ${gff_files}/${bin}.gene.gtf
    gzip ${gff_files}/${bin}.gene.gtf
done
