#!/bin/sh

# Script for running SnpEff

# SLURM HEADER
############################################
# JOB INFO
#SBATCH --account=****
#SBATCH --job-name=SnpEff
#SBATCH --mem=50G
#SBATCH --cpus-per-task=24
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sergio.rod.lla@gmail.com
#SBATCH --output=/mnt/lustre/scratch/srodriguez/log_%J.out
#SBATCH --error=/mnt/lustre/scratch/srodriguez/log_%J.err

# Adding variables
snpeff=/home/srodriguez/srodriguez/SnpEff/snpEff
vcf=/mnt/lustre/scratch/srodriguez/data/VCF_files
output=/mnt/lustre/scratch/srodriguez/data/SnpEff

# Code
# creating MAGs databases: $ java -jar ${snpeff}/snpEff.jar build -gff3 -v <binV2>
java -Xmx8g -jar ${snpeff}/snpEff.jar -v -stats ${output}/bin120V2.html bin120V2 ${vcf}/bin120.addRG.merged.vcf > ${output}/bin120V2.ann.vcf
java -Xmx8g -jar ${snpeff}/snpEff.jar -v -stats ${output}/bin208V2.html bin208V2 ${vcf}/bin208.addRG.merged.vcf > ${output}/bin208V2.ann.vcf
java -Xmx8g -jar ${snpeff}/snpEff.jar -v -stats ${output}/bin216V2.html bin216V2 ${vcf}/bin216.addRG.merged.vcf > ${output}/bin216V2.ann.vcf
java -Xmx8g -jar ${snpeff}/snpEff.jar -v -stats ${output}/bin228V2.html bin228V2 ${vcf}/bin228.addRG.merged.vcf > ${output}/bin228V2.ann.vcf

