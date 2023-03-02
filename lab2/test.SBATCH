#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=2:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=torch
#SBATCH --account=ece_gy_9143-2023sp
#SBATCH --partition=n2c48m24

singularity exec --nv \
	    --overlay /scratch/sz3714/pytorch-example/my_pytorch.ext3:ro \
	    /share/apps/images/cuda11.6.124-cudnn8.4.0.27-devel-ubuntu20.04.4.sif\
	    /bin/bash -c "source /ext3/env.sh; python lab2_c1.py --num_workers 2"
