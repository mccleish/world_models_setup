#!/bin/bash
#SBATCH --job-name=eval_puppeteer
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --mem=32G 
#SBATCH --cpus-per-task=4
#SBATCH --time=00:30:00
#SBATCH --output=slurm-eval-%j.out


source ~/miniforge3/etc/profile.d/conda.sh
conda activate puppeteer

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ccm141/.mujoco/mujoco210/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export CPATH=$CONDA_PREFIX/include
export MUJOCO_GL=egl 

python /home/ccm141/puppeteer/puppeteer/evaluate.py \
  task=tracking \
  checkpoint=/cache/home/ccm141/puppeteer/puppeteer/logs/tracking/1/default/models/180000.pt \
  save_video=true
