# quick-shutdown
Linux application that allows performing shutdown quickly by just clicking its icon written in Vala

## Installation
 1. Clone the repo.
 2. From `quick-shutdown` directory in the terminal type `meson build --prefix=/usr` then enter.
 3. If `meson` is installed and worked fine go to the next step, otherwise, install meson using `sudo apt install meson` or any equivalent way compatible with your Linux distro.
 4. `cd build` 
 5. `ninja` then `sudo ninja install`.
 6. That's all.

 ## Adding optional confirm
 [!Screenshot](screenshot.png "Confirmation Window")
 To allow an optional quick confirmation message before shutdown, in the case of hitting the application icon on mistake. You just have to enter the follwoing command in the bash terminal:
 ```
 touch ~/.config/com.github.saidbakr.quick-shutdown/confirm
 ```
 That command creates an empty file at `yourHomeDir/.config/com.github.saidbakr.quick-shutdown/confirm` and if you want to restore the default bahvior of immediate shutdown, you have to delete or rename the the file named `confirm` in that path.
 
 ### Notice:
 If you get any issue about GTK dependency during running `meson` try to `sudo apt install libgtk-3-dev` or if you use non debian based distro, the follwoing is an *[**example**](https://wiki.gnome.org/Projects/Vala/GTKSample "The hint reference")* to install GTK there:
 ```
 Fedora >= 15: gtk3-devel
 openSUSE >= 11.4: gtk3-devel
 ```


