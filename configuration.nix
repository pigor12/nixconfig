#       Data: 13/09/2022
#       Computador: 'NEPTUNE' - Laptop
#       Nome do arquivo: 'configuration.nix'
#       Autor: Pedro Igor Martins dos Reis (@pedroigorreis)

{ config, pkgs, ... }:

{
        # Configurações de inicialização
        boot =
        {
                loader =
                {
                        systemd-boot.enable = true;
                        efi.canTouchEfiVariables = true;
                };
                consoleLogLevel = 0;
                initrd.verbose = false;
                plymouth.enable = true;
                initrd.kernelModules = [ "amdgpu" ];
        };

        # NixOS options
        system =
        {
                stateVersion = "22.05";
                autoUpgrade.enable = true;
        };

        #  HW Accel. and extra settings
        hardware =
        {
                opengl =
                {
                        driSupport = true;
                        extraPackages = with pkgs;
                        [
                                rocm-opencl-icd
                                rocm-opencl-runtime
                        ];
                };
                bluetooth.enable = true;
                pulseaudio.enable = false;
        };

        # Basic services
        services =
        {
                pipewire =
                {
                        enable = true;
                        pulse.enable = true;
                };
                fwupd.enable = true;
                printing.enable = true;
                resolved.enable = true;
                geoclue2.enable = true;
                power-profiles-daemon.enable = true;
        };

        # Security modules
        security =
        {
                rtkit.enable = true;
                apparmor.enable = true;
        };

        # Networking settings
        networking =
        {
                hostName = "NEPTUNE";
                firewall.enable = true;
                networkmanager.enable = true;
        };

        location.provider = "geoclue2";

        # Global environment
        environment =
        {
                sessionVariables =
                {
                        # Java's environment (Antialiasing + HW Accel.)
                        JDK_JAVA_OPTIONS="-Dsun.java2d.opengl=true";
                        _JAVA_OPTIONS="-Dswing.aatext=true -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel";
                };
        };

        # Aditional files
        imports =
        [
                ./myPantheon.nix
                # ./myXfce.nix
                # ./myPlasma.nix
                ./hardware-configuration.nix
        ];

        # My extra fonts
        fonts.fonts = with pkgs;
        [
                ubuntu_font_family
        ];

        # Sound ON
        sound.enable = true;

        # My user
        users.users.pedroigor =
        {
                isNormalUser = true;
                description = "Pedro Igor";
                extraGroups = [ "networkmanager" ];
        };

        # GNU Nano settings
        programs.nano.nanorc =
        "
                set nohelp
                set indicator
                set smarthome
                set emptyline
                set autoindent
                set linenumbers
                set multibuffer
                set tabstospaces
                set casesensitive
                set titlecolor normal
                set numbercolor normal
        ";

        # Keyboard layout
        console.keyMap = "br-abnt2";

        # Persist GTK theme on Wayland
        programs.dconf.enable = true;

        # Locale settings
        i18n.defaultLocale = "pt_BR.UTF-8";

        # Time zone
        time.timeZone = "America/Sao_Paulo";
}
