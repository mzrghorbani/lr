# Building/Simulating the Linear Regression (LR) Project #

This repository contains the payload project for the Linear Regression - compatible with the extensible, modular firmware framework for phase-2 upgrades.

## Directory structure ##

The repository has 3 main subdirectories:

* `top` : Contains top-level `.dep` and VHDL files for the available project configurations,
* `framework` : Contains LR sources implementing the stub and track handling logic, and associated IP cores,
* `updater` : Contains HLS generated IP core for LR design ready for instantiation into firmware.

## Instructions for developers ##

Make sure that the [Prerequisites](#prerequisites) are satisfied.

##### Step 1: Setup the work area

Use the branch names listed in https://twiki.cern.ch/twiki/bin/view/CMS/CMSUKTrkTrigFirmware .

The Linear Regression implementation is being developed in a separate repository in <master> branch. 

```
ipbb init work
cd work
ipbb add git https://github.com/ipbus/ipbus-firmware -b <branch_name>
ipbb add git https://:@gitlab.cern.ch:8443/p2-xware/firmware/emp-fwk.git -b <branch_name>
ipbb add git https://:@gitlab.cern.ch:8443/cms-cactus/firmware/mp7.git -b <branch_name>
ipbb add git https://:@gitlab.cern.ch:8443/cms-uk-tracktrigger/firmware/l1tf.git -b <branch_name>
ipbb add git https://:@gitlab.cern.ch:8443/cms-uk-tracktrigger/firmware/txt_files.git -b <branch_name>
ipbb add git https://:@gitlab.cern.ch:8443/mghorban1/lr.git -b master
```

where `branch_name` is the name of the branch you would like to check out.  Using ipbb add git without the `-b` option will check out the `master` branch. Check [here](https://twiki.cern.ch/twiki/bin/view/CMS/CMSUKTrkTrigFirmware) for the list of current compatible branches.

##### Step 2: Create an ipbb project area

For implementation:
```
ipbb proj create vivado my_project_name lr:top -t vcu118.dep (VU9P board)
cd proj/my_project_name
```

For simulation testbench:
```
ipbb proj create sim my_project_name lr:top -t sim_vu9p.dep
cd proj/my_project_name
```

##### Step 3: Implementation and simulation

For implementation:
```
ipbb vivado make-project
ipbb vivado synth -j4 impl -j4
ipbb vivado package
```

For simulation testbench:
```
ipbb sim setup-simlib
ipbb sim ipcores
ipbb sim mifs
ipbb sim make-project

mkdir debug
./vsim -c work.top -Gsourcefile=<input.txt> -Gsinkfile=<out.txt> 
```
where `input.txt` follows the standard pattern file convention

## Prerequisites ##

 * Xilinx Vivado 2018.2 (or later)
 * Python 2.7 - available on most linux distributions, natively or as [miniconda](https://conda.io/miniconda.html) distribution.
 * ipbb - the IPbus Builder Tool. Note: a single `ipbb` installation is sufficient for any number of projects.
 
```
curl -L https://github.com/ipbus/ipbb/archive/v0.5.2.tar.gz | tar xvz
source ipbb-0.5.2/env.sh
```
## Changing the clock frequency.

This is given by 40 MHz * CLOCK_RATIO, where the latter is defined in lr/top/firmware/hdl/top_decl.vhd .
You may also need to change CLOCK_COMMON_RATIO, so it remains a multiple of all CLOCK_RATIOs.
