#! /bin/bash
setting="combined_imask_nmask"
scene_id="0000"
sequence_id="250"
log_path="/home/oq55olys/Cluster/LiDAR4D/cluster_log_dataset/"
CUDA_VISIBLE_DEVICES=0 python main_lidar4d_sim.py \
--config configs/kitti360_$sequence_id"_"$scene_id.txt \
--workspace $log_path/kitti360_lidar4d_f$sequence_id"_"$scene_id"_"$setting/simulation \
--ckpt $log_path/kitti360_lidar4d_f$sequence_id"_"$scene_id"_"$setting/checkpoints/big_improved_ep0400_refine.pth \
--H_lidar 64 \
--W_lidar 1024 \
--shift_x 0.0 \
--shift_y 0.0 \
--shift_z 0.0 \
--align_axis \
--interpolation_factor 0.0 \
--shift_z_top -0.20287499  \
--shift_z_bottom -0.12243641 \
--fov_lidar 1.9647572 11.0334425 -8.979475  16.52717 \
--out_lidar_dim 3 \
# -0.382 \
#--shift_z_bottom -0.121 \
#--fov_lidar 2.0 13.45 -11.45 13.45 \
#--num_layers_flow 2 \
#--hidden_dim_flow 32 \
# --kitti2nus
#--workspace log/kitti360_lidar4d_f1538_release/simulation \
#--ckpt log/kitti360_lidar4d_f1538_release/checkpoints/lidar4d_ep0500_refine.pth \

#--config configs/kitti360_1538.txt \
#--workspace log/kitti360_lidar4d_f1538_wip/simulation \
#--ckpt log/kitti360_lidar4d_f1538_wip/checkpoints/incidence_ep0167.pth \
