Copyright 2020 - The Khalvat-M Project

# Device configuration for Samsung Galaxy S4 LTE-A
## Unified variants: GT-I9506 , SHV-E330S , SHV-E330K , SHV-E330L

Basic   | Specification List
-------:|:-------------------------
CPU     | Quad-core 2.3 GHz Krait 400
Chipset | Qualcomm Snapdragon 800
GPU     | Adreno 330
Memory  | 2 GB
Shipped Android Version | 4.2.2 (Jelly Bean), upgradable to 5.0.1 (Lollipop); TouchWiz UI
Storage | 16/32 GB
MicroSD | Up to 64 GB
Battery | Removable Li-Ion 2600 mAh
Usb | microUSB 2.0 (MHL 2 TV-out), USB Host
Dimensions | 136.6 x 69.8 x 7.9 mm (5.38 x 2.75 x 0.31 in)
Display | 1080 x 1920 pixels 16:9 ratio (~441 ppi density)
Rear Camera  | 13 MP, f/2.2, 31mm, OIS, autofocus, LED flash
Front Camera | 2 MP, f/2.4, 27mm (wide), Dual video call
Release Date | November 2013

![Galaxy S4 LTE-A](https://github.com/Khalvat-M/android_device_samsung_ks01ltexx/blob/11.0/information/ks01lte.gif)

# For building Android R
### Create `.repo/local_manifests/roomservice.xml` with the following content:

***
```xml
<?xml version="1.0" encoding="UTF-8"?>
 <manifest>
        
 <remote  name="khalvat"
    fetch="https://github.com/Khalvat-M"
    revision="11.0" />

 <remote  name="linos"
    fetch="https://github.com/LineageOS"
    revision="lineage-18.0" />

    <!--LineageOS -->
    <project name="android_hardware_samsung" path="hardware/samsung" remote="linos" />
    <project name="android_hardware_sony_timekeep" path="hardware/sony/timekeep" remote="linos"/>
              
    <!--Device -->
    <project name="device_samsung_ks01ltexx" path="device/samsung/ks01ltexx" remote="khalvat" />
    <project name="device_samsung_msm8974-common" path="device/samsung/msm8974-common" remote="khalvat" />
           
    <!--Kernel -->
    <project name="kernel_samsung_msm8974" path="kernel/samsung/msm8974" remote="khalvat" />
    
    <!--Vendor -->
    <project name="vendor_samsung" path="vendor/samsung" remote="khalvat" />
                  
 </manifest>
```
