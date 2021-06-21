#!/bin/sh

# Script for using Prodigal

# SLURM HEADER
############################################
# JOB INFO
#SBATCH --account=****
#SBATCH --job-name=Prodigal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sergio.rod.lla@gmail.com
#SBATCH --output=/mnt/lustre/scratch/srodriguez/log_%J.out
#SBATCH --error=/mnt/lustre/scratch/srodriguez/log_%J.err

# Load the modules you'll need
module load prodigal/2.6.3

# Declare variables (add more comments)
genomes=/mnt/lustre/scratch/srodriguez/data/genomes

# Add the job...
prodigal -i ${genomes}/bin120.fa -f gff -p meta -o /mnt/lustre/scratch/srodriguez/data/genes_prodigal/bin120.genes.gff
prodigal -i ${genomes}/bin208.fa -f gff -p meta -o /mnt/lustre/scratch/srodriguez/data/genes_prodigal/bin208.genes.gff
prodigal -i ${genomes}/bin216.fa -f gff -p meta -o /mnt/lustre/scratch/srodriguez/data/genes_prodigal/bin216.genes.gff
prodigal -i ${genomes}/bin228.fa -f gff -p meta -o /mnt/lustre/scratch/srodriguez/data/genes_prodigal/bin228.genes.gff
