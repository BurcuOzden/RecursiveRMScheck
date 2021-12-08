# RecursiveRMScheck

RecursiveRMScheck calculates Root Mean Square Devation (RMSD) between all pdb pairs in the recursive folders one by one and generates RMSD file of each folder into **_outputs_** folder.

To use this tool, you should have two input directories with the names of _pdbfolders_ and _scripts_.
- **pdbfolders** folder includes the subdirectories with the name of mutations and each folder contains the generated 6 models. You need to generate _list_foldernames.txt_ which includes the folder names.
- **scripts** folder contains two script files: 
  - _rmsd.pml_ is the PyMOL script that calculates the RMSD between two given pdb files. So, it is important to note that to be able to use this script you should have PyMOL downloaded in your computer. If not you can dowload from the [link](https://pymol.org/2/).
  - _RMSD_calculation.csh_ uses rmsd.pml script to generates RMSD files as RMS__foldername_ into the **_outputs_** folder. 
 
When you are in the _scripts_ directory, use below command to run the script.

```
$ ./RMSD_calculation.csh
```

**outputs** folder contains the final RMS files of each folder.

**Note1:** RMSD calculation is performed by using PyMOL. So, if you do not have it on your computer, you can dowload from the [link](https://pymol.org/2/).

**Note2:** Please _do not_ forget to change the path of PyMOL with the correct path in your computer!

If you have any questions, please contact with burcu.ozden@ibg.edu.tr 


