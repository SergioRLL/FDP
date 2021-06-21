#!/bin/sh

# Script for creating a SIFT DB

# SLURM HEADER
############################################
# JOB INFO
#SBATCH --account=****
#SBATCH --job-name=makeSIFTdb
#SBATCH --mem=50G
#SBATCH --cpus-per-task=24
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sergio.rod.lla@gmail.com
#SBATCH --output=/mnt/lustre/scratch/srodriguez/log_%J.out
#SBATCH --error=/mnt/lustre/scratch/srodriguez/log_%J.err

# Load the modules you'll need
module load perl/5.28

# Adding variables
sift=/mnt/lustre/bio/users/srodriguez/SIFT/scripts_to_build_SIFT_db/make-SIFT-db-all.pl
config_file=/mnt/lustre/bio/users/srodriguez/SIFT/scripts_to_build_SIFT_db/test_files/bin120_config.txt

# Code

perl ${sift} -config ${config_file}
