#!/bin/bash
#BSUB -n 1
#BSUB -W 48:00
#BSUB -q gpu
#BSUB -gpu "num=1"
#BSUB -J training_rnn_wa_hist40
#BSUB -o /share/csc591s25/adhage/GenAI-for-Systems-Gym/homework-1/models/RNN_with_Attention/logs/out.%J
#BSUB -e /share/csc591s25/adhage/GenAI-for-Systems-Gym/homework-1/models/RNN_with_Attention/logs/err.%J


source ~/.bashrc
conda activate /share/$GROUP/conda_env/new_env
cd /share/$GROUP/$USER/GenAI-for-Systems-Gym/homework-1/models/RNN_with_Attention

python3 -m cache_replacement.policy_learning.cache_model.main \
  --experiment_base_dir=/share/$GROUP/$USER/GenAI-for-Systems-Gym/homework-1/models/RNN_with_Attention/experiments \
  --experiment_name=train_rnn_wa_hist40 \
  --cache_configs=cache_replacement/policy_learning/cache/configs/default.json \
  --model_bindings="loss=[\"ndcg\", \"reuse_dist\"]" \
  --model_bindings="address_embedder.max_vocab_size=5000" \
  --model_bindings="sequence_length=40" \
  --train_memtrace=/share/$GROUP/traces/astar_313B_train.csv \
  --valid_memtrace=/share/$GROUP/traces/astar_313B_valid.csv