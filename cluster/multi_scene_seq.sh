#!/bin/bash -l
SCENE_IDs="0000" # 0002 0003 0004 0005 0006 0007 0009 0010"
#1538 1728 1908 3353 2350 4950 8120 10200 10750 11400"
SEQ_IDs0000="4950" # 1908 8120 2350 10750" # 1728 1908 3353 2350 4950 8120 10200 10750 11400"

#250 500 750 1322 1572 1822 2072 2322 2572 2822 3072 3322 3572 3822 4072 4360 4610 4860 5110 5371 5932 6182 6432 6682 6932 7182 7432 7682 7932 8201 8451 8701 8951 9609 9859 10109 10375 10625 10875 11143"

SEQ_IDs0002="4391 4641 4891 5209 5459 5975 6225 6475 6771 7021 7271 7528 7778 8028 8278 8562 8812 9148 9398 9648 9940 10239 10489 10797 11047 11635 11885 12135 12385 12635 12885 13177 13498 13748 13998 14248 14498 14748 14998 15248 15498 15748"
SEQ_IDs0003="272 397 522 647 772 897"
SEQ_IDs0004="2914 3164 3414 3997 4247 4497 4785 5035 5285 5620 5870 6120 6408 6669 6919 7169 7419 7669 7919 8169 8419 8669 8919 9169 9419 9669 9996 10246 10496 10746 10996"
SEQ_IDs0005="286 536 815 1138 1388 1638 1888 2138 2388 2638 2888 3138 3445 3695 4018 4287 4537 4787 5037 5311 5580 6142 6392"
SEQ_IDs0006="347 649 899 1149 1399 1649 1899 2149 2399 2738 2988 3238 3757 4007 4257 4569 4819 5069 5319 5764 6014 6264 6514 6764 7014 7264 7514 7764 8014 8264 8514 8764 9014 9264"
SEQ_IDs0007="2 252 502 752 1002 1252 1502 1752 2310 2739"
SEQ_IDs0009="335 586 836 1091 1341 1591 1864 2114 2364 2614 2864 3114 3364 3614 3864 4114 4364 4614 4978 5238 5488 5738 5988 6238 6488 6738 6988 7238 7488 8022 8273 8523 8773 9033 9283 9562 9817 10067 10886 11168"
SEQ_IDs0010="264 514 765 1041 1291 1627 1877 2156 2776 3026"



#sequence="$1"
#setting="$2"
#tag="$3"
#opt_params="$4"
#lr_factors="$5"
#rolling_shutter="$6"
#lidar_dim="$7"
tag="default"
#tag="big_improved"
for SCENE_ID in $SCENE_IDs
do
  SEQ_IDs=$(eval echo \${SEQ_IDs$SCENE_ID})
  #echo "Processing scene $SCENE_ID with sequence IDs: $SEQ_IDs"
  for SEQ_ID in $SEQ_IDs
  do
    #cluster/dcluster_train.sh $SEQ_ID "baseline" $tag "" "" "" 2 0.0 $SCENE_ID
    #cluster/dcluster_train.sh $SEQ_ID "combined_imask_nmask_0" $tag "laser_strength near_range_threshold near_range_factor distance_scale near_offset distance_fall" "0.1 0.05 0.05 0.005 0.1 0.1" "True" 3 0.0 $SCENE_ID
    cluster/dcluster_train.sh $SEQ_ID "combined_imask_nmask" $tag "laser_strength near_range_threshold near_range_factor distance_scale near_offset distance_fall" "0.1 0.05 0.05 0.005 0.1 0.1" "True" 3 0.2 $SCENE_ID
    #cluster/dcluster_train.sh $SEQ_ID "distance" $tag "near_range_threshold near_range_factor distance_scale near_offset distance_fall" "0.05 0.05 0.01 0.1 0.1" "" 2 0.0 $SCENE_ID
    #cluster/dcluster_train.sh $SEQ_ID "imask" $tag "" "" "" 2 0.0 $SCENE_ID
    #cluster/dcluster_train.sh $SEQ_ID "laser" $tag "laser_strength" "0.1" "" 2 0.0 $SCENE_ID
    #cluster/dcluster_train.sh $SEQ_ID "motion" $tag "" "" "True" 2 0.0 $SCENE_ID
    #cluster/dcluster_train.sh $SEQ_ID "poses_motion" $tag "R T" "0.01 0.01" "True" 2 0.0 $SCENE_ID
    #cluster/dcluster_train.sh $SEQ_ID "poses_no_motion" $tag "R T" "0.01 0.01" "" 2 0.0 $SCENE_ID
    #cluster/dcluster_train.sh $SEQ_ID "reflectance" $tag "" "" "" 3 0.0 $SCENE_ID
    #cluster/dcluster_train.sh $SEQ_ID "reflectance_nmask" $tag "" "" "" 3 0.2 $SCENE_ID
    #cluster/dcluster_train.sh $SEQ_ID "reflectance2" $tag "" "" "" 3 0.2 $SCENE_ID

  done
done

