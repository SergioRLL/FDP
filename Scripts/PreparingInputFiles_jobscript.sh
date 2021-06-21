#!/bin/sh

# Script for producing input files for InStrain: .stb and mappings (.bam)

# SLURM HEADER
############################################
# JOB INFO
#SBATCH --account=****
#SBATCH --job-name=InStrain_inputs
#SBATCH --mem=50G
#SBATCH --cpus-per-task=24
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sergio.rod.lla@gmail.com
#SBATCH --output=/mnt/lustre/scratch/srodriguez/log_%J.out
#SBATCH --error=/mnt/lustre/scratch/srodriguez/log_%J.err

# Load the modules you'll need
module load python/3.8.5 samtools bowtie2/2.3.4.1

# Declare variables (add more comments)
reads_folder=/mnt/lustre/bio/shared/ecomics/bbmo.sola/fastq.clean/hardlinks
data=/mnt/lustre/scratch/srodriguez/data
genomes=/mnt/lustre/scratch/srodriguez/data/genomes
joint_genomes=/mnt/lustre/scratch/srodriguez/data/genomes/joint_genomes.fa
bams=/mnt/lustre/scratch/srodriguez/data/new_bams
THREADS=24

# Add the job...
# Making the scaffold-to-bin file (.stb)
echo "Making the scaffold-to-bin file (.stb)..."
parse_stb.py --reverse -f ${genomes}/bin* -o ${data}/genomes.stb
echo "DONE!!!"

echo "Indexing .fasta file..."
bowtie2-build ${joint_genomes} ${data}/bt2/joint_genomes.fa

ls $reads_folder | sed 's/_.*//' | sort -u | while read -r sample
do
r1=$reads_folder/${sample}_R1.clean.fastq.gz
r2=$reads_folder/${sample}_R2.clean.fastq.gz

# Mapping reads to assembly using bowtie2
echo "Mapping sample: ${sample}..."
bowtie2 -p 6 -x ${data}/bt2/joint_genomes.fa -1 $r1 -2 $r2 > ${bams}/${sample}.clean.sam

# sort and convert sam to bam with SAMTOOLS
echo "Sorting File and Converting to BAM..."
samtools sort -@ $THREADS -o ${bams}/${sample}.clean.bam \
                        ${bams}/${sample}.clean.sam
echo "Indexing BAM..."
samtools index ${bams}/${sample}.clean.bam

echo "Removing SAM..."
rm ${bams}/${sample}.clean.sam

echo "Sample $sample DONE"
done

echo "DONE!!!"
