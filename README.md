# qmenu
qmenu is a modular quick-access menu program, designed to facilitate easy access to applications, cli commands, and other applications.

Dependencies:
The core application (qmenu.sh, main_menu.sh and menu_engine.sh) are simple scripts that will not require the average user to install any additonal software.



Installation
Perform the following command to clone qmenu

      git clone https://github.com/ELCI-Linux/qmenu
Change directory to qmenu

      cd qmenu
Run the installation script with sudo permission

      sudo bash qmenu_install.sh


Usage Examples

Listing files:

      input=$(ls); prompt="Select a file"; source /bin/qmenu/menu_engine
