#!/bin/sh

# Script for running VEP

# SLURM HEADER
############################################
# JOB INFO
#SBATCH --account=****
#SBATCH --job-name=VEP
#SBATCH --mem=50G
#SBATCH --cpus-per-task=24
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sergio.rod.lla@gmail.com
#SBATCH --output=/mnt/lustre/scratch/srodriguez/log_%J.out
#SBATCH --error=/mnt/lustre/scratch/srodriguez/log_%J.err

# Load the modules you'll need
module load miniconda
source /home/apps/miniconda/4.5.x/etc/profile.d/conda.sh
conda activate eukulele-1.0.4
module load perl/5.28

# Add variables
vcf_files=/mnt/lustre/scratch/srodriguez/data/VCF_files
fasta_files=/mnt/lustre/scratch/srodriguez/data/genomes
output=/mnt/lustre/scratch/srodriguez/data/VEP
gff_files=/mnt/lustre/scratch/srodriguez/data/genes_annotated

# Code
# for vcf in ${vcf_files}/*
# do
#    bin="${vcf##*/}"
#    bin="${bin%%.*}"
#    /home/srodriguez/srodriguez/ensembl-vep/vep -i ${vcf} -o ${output}/variant_effect_output_${bin}.txt --force_overwrite --sift b --variant_class --gff ${gff_files}/${bin}.gff.gz \
# --fasta ${fasta_files}/${bin}.fa (--species bacteria_actinobacteria --database --genomes --is_multispecies 1)
# done

/home/srodriguez/srodriguez/ensembl-vep/vep -i ${vcf_files}/bin120.addRG.merged.vcf -o ${output}/variant_effect_output_bin120.txt --force_overwrite --sift b --variant_class --gff ${gff_files}/bin120.gff.gz --fasta ${fasta_files}/bin120.fa --species acidimicrobium_ferrooxidans_dsm_10331_gca_000023265 --cache --cache_version 51 --offline

