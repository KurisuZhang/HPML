#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=5:00:00
#SBATCH --mem=8GB
#SBATCH --gres=gpu
#SBATCH --job-name=torch
#SBATCH --account=ece_gy_9143-2023sp
#SBATCH --partition=n1s8-v100-1

singularity exec --nv \
	    --overlay /scratch/sz3714/pytorch-example/my_pytorch.ext3:ro \
	    /share/apps/images/cuda11.6.124-cudnn8.4.0.27-devel-ubuntu20.04.4.sif\
	    /bin/bash -c "source /ext3/env.sh; python lab2_c7.py"
