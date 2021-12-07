#!/bin/csh

# Prepared by Burcu Ozden, 2021-12-02
# It calculates the RMSD between all pdb pairs in the recursive folders one by one.
# rmsd.pml scripts run the PyMOL to calculate the RMSD between two pdb files.
# Do not forget to change the PyMOL path according to your computer.
# "list_foldernames.txt" should be given as an input in pdbfolders, which contains the folder names.
# Outputs: outputs folder is generated and includes RMS_"foldernames".
# Run the code in scripts folder.

#give the folder list in list_foldernames.txt file
set foldername=`cat ../pdbfolders/list_foldernames.txt`

mkdir ../outputs
touch RMS_log

foreach i($foldername)
	cp rmsd.pml ../pdbfolders/$i
	cd ../pdbfolders/$i
	
#give the PyMOL path in your computer carefully!
	/Applications/MacPyMOL.app/Contents/MacOS/MacPyMOL -qc `ls *pdb | xargs` rmsd.pml | grep "RMS" > log
	
	paste rmsd.pml log | sed 's/align //' | sed 's/cycles=0//' | sed 's/Executive: RMS =    //' | sed "s/\*/"$i"/g" | awk '{print $1,$2,$3}' > "RMS_"$i
	
	mv "RMS_"$i ../../outputs
	
	rm  log rmsd.pml
	cd ../../scripts
end

echo DONE!
