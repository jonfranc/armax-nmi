# Data-driven Thermal Model Inference with ARMAX, in Smart Environments, based on Normalized Mutual Information

This repo is for time-series inference of room thermal dynamics, using ARMAX and Normalized Mutual Information.

This is the official repository that implements the following paper:

> *Zhanhong Jiang, Jonathan Francis, Anit Kumar Sahu, Sirajum Munir, Charles Shelton, Anthony Rowe, Mario Berges. Data-driven Thermal Model Inference with ARMAX, in Smart Environments, based on Normalized Mutual Information. In 2018 Annual American Control Conference, ACC 2018, Milwaukee, WI, USA, June 27-29, 2018. pages 4634-4639, IEEE, 2018. https://ieeexplore.ieee.org/document/8431085*

# Getting started

Please see the armax_model_occupancy_temperature_CMU_06_08 for more details in comments.

The ARMAX model in MATLAB is used for the temperature prediction.

For the NMI part, please use the directory: NMI_occupancy/InfoTheory to see ‘mutual_information_CMU_06_08.m’ for an example. One can call other functions in the InfoTheory folder to calculate not only NMI, but also MI, etc. In the ARMAX folder, a file called matrix_visualization.m is used for generate the NMI matrix.

# Feedback

Please send any feedback to zhanhong.jiang@jci.com and jon.francis@us.bosch.com.

# Citation

If you use ARMAX-NMI, please cite us as follows:

```
@INPROCEEDINGS{8431085,
  author={Z. {Jiang} and J. {Francis} and A. K. {Sahu} and S. {Munir} and C. {Shelton} and A. {Rowe} and M. {Bergés}},
  booktitle={2018 Annual American Control Conference (ACC)},
  title={Data-driven Thermal Model Inference with ARMAX, in Smart Environments, based on Normalized Mutual Information},
  year={2018},
  volume={},
  number={},
  pages={4634-4639},
}
```
