# Safe Area
Few scripts to create an encrypted area hosted by a single file and use it.
I use these scripts on Ubuntu 14.04. No other environments has been tried.

## safearea-create  
This script makes the magic: it creates the area for you the first time. If all works fine, the area is mounted under  
`/media/<you>/safe`  
at the end of the script .  
You are supposed to give the size of the file.  

**Usage**  
`safearea-create 50G`  


**NOTE** The script creates the file that hosts the partition using "truncate". So far this solution seems working pretty well to me. If you prefer to preallocate the space, use "fallocate" instead.

## safearea-on
The script opens and mounts the partition.  

**Short form:** `saon`  

## safearea-off
The script closes and unmounts the partition.  

**Short form:** `saoff`  

**Note**  
You can also unmount and close the partition right clicking the icon of the driver in the pannel.



