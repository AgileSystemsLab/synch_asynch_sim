# synch_asynch_sim

This repository supports running the MATLAB simulations for the synch-asynch paper.

Workflow:

Specify simulation type ('robobee', 'moth', or 'roboflapper') in run_analysis.m Specify simulation parameters in load_simulation_param.m. The most common change is ntests, which specifies the parameter grid size (ntests x ntests) Modify system parameters. This is typically unnecessary unless the flapper or bee was modified. Run run_analysis.m. This script loads system and simulation parameters. Then goes through a force tuning procedure (see notes below). After force tuning, the heavy lifting is done in run_simulation.m. After data is generated, visualization code is ran. Finally, data is saved for final plotting in Python.

MATLAB setup:

Code is run on MATLAB 2020a with Simulink Desktop Realtime

Notes:

When run_analysis.m is ran, it will begin with an iterative force tuning procedure. It essentially adjusts the ratio of the synchronous to asynchronous force until a user-specified metric is identical for the peak synchronous and peak asynchronous conditions. This parameter is currently named opt_param in run_one_simulation.m. For example, if opt_param is set to peak oscillation amplitude, the iterative tuning procedure will adjust the synch and asynch forces until synch and asynch oscillation amplitude are sufficiently close.
