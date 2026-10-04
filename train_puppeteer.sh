#!/bin/bash
#SBATCH --job-name=puppeteer_train
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1           
#SBATCH --mem=32G
#SBATCH --time=72:00:00

#initialize environment
source ~/miniforge3/etc/profile.d/conda.sh
conda activate puppeteer

#export paths for C++ binaries, NVIDIA drivers, OpenGL headers
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ccm141/.mujoco/mujoco210/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export CPATH=$CONDA_PREFIX/include
export MUJOCO_GL=egl 

cd /home/ccm141/puppeteer/puppeteer
#launch training job
python train.py task=tracking
