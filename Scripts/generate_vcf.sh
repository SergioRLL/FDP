#!/bin/sh

# Script for generating VCF files using Freebayes

# SLURM HEADER
############################################
# JOB INFO
#SBATCH --account=****
#SBATCH --job-name=Freebayes
#SBATCH --mem=50G
#SBATCH --cpus-per-task=24
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sergio.rod.lla@gmail.com
#SBATCH --output=/mnt/lustre/scratch/srodriguez/log_%J.out
#SBATCH --error=/mnt/lustre/scratch/srodriguez/log_%J.err

# Load the modules you'll need
module load miniconda
source /home/apps/miniconda/4.5.x/etc/profile.d/conda.sh
conda activate ip_env
# snakemake -s snakefiles/step_filter --unlock

# Variables
bams=/mnt/lustre/scratch/srodriguez/data/addRGbams
vcf_files=/mnt/lustre/scratch/srodriguez/data/VCF_files

# Job
for bin in $bams/*
do
    bin_name="${bin##*/}"
    fasta=/mnt/lustre/scratch/srodriguez/data/genomes/${bin_name}.fa
    merged_bam=${bin}/${bin_name}.addRG.merged.bam
    # call variants assuming an haploid sample
    freebayes -f ${fasta} -p 1 ${merged_bam} > ${vcf_files}/${bin_name}.addRG.merged.vcf
done

