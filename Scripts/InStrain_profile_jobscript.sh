#!/bin/sh

# Script for using inStrain profile

# SLURM HEADER
############################################
# JOB INFO
#SBATCH --account=****
#SBATCH --job-name=inStrain_profile
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sergio.rod.lla@gmail.com
#SBATCH --output=/mnt/lustre/scratch/srodriguez/log_%J.out
#SBATCH --error=/mnt/lustre/scratch/srodriguez/log_%J.err

# Load the modules you'll need
module load python/3.8.5 samtools

# Declare variables
fasta_file=/mnt/lustre/scratch/srodriguez/data/genomes/joint_genomes.fa
gene_file=/mnt/lustre/scratch/srodriguez/data/genes_prodigal/joint_genomes.fna
stb_file=/mnt/lustre/scratch/srodriguez/data/genomes.stb

# Add the job...
for bam_file in /mnt/lustre/scratch/srodriguez/data/new_bams/*.bam
do
    name="${bam_file##*/}"
    name="${name%.*}.IS"
    inStrain profile $bam_file $fasta_file -o ~/srodriguez/InStrain_analyses/joint_genomes_1.5.1/$name -p 6 -g $gene_file -s $stb_file
done

