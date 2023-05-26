#       Data: 17/09/2022
#       Computador: 'NEPTUNE' - Laptop
#       Nome do arquivo: 'myXfce.nix'
#       Autor: Pedro Igor Martins dos Reis (@pedroigorreis

{ config, pkgs, ... }:

{
        services =
        {
                xserver =
                {
                        layout = "br";
                        enable = true;
                        displayManager =
                        {
                                lightdm =
                                {
                                        enable = true;
                                        greeters.gtk =
                                        {
                                                indicators =
                                                [
                                                        "~spacer"
                                                        "~hostname"
                                                        "~session"
                                                        "~power"
                                                        "~clock"
                                                        "~spacer"
                                                ];
                                                extraConfig =
                                                "
                                                        [greeter]
                                                        font-name = Ubuntu 10
                                                ";
                                                clock-format = "%H:%M";
                                                theme.name = "Qogir-Dark";
                                                iconTheme.name = "Qogir-dark";
                                                cursorTheme.name = "Qogir-dark";
                                        };
                                };
                                defaultSession = "xfce";
                        };
                        desktopManager =
                        {
                                xfce =
                                {
                                        enable = true;
                                        thunarPlugins = with pkgs; with xfce;
                                        [
                                                thunar-volman
                                                thunar-archive-plugin
                                        ];
                                };
                        };
                        videoDrivers = [ "amdgpu" ];
                };
                redshift =
                {
                        enable = true;
                        brightness =
                        {
                                day = "1";
                                night = "1";
                        };
                        temperature =
                        {
                                day = 5500;
                                night = 3700;
                        };
                };
                blueman.enable = true;
                
        };

        environment =
        {
                systemPackages = with pkgs; with xfce;
                [
                        # Miscellaneous
                        xz
                        unzip
                        pavucontrol
                        aspellDicts.pt_BR

                        # Themes
                        qogir-theme
                        qogir-icon-theme

                        # Work
                        jdk8
                        firefox

                        # Development
                        git
                        
                        # Xfce's applications
                        mousepad
                        xarchiver
                        xfce4-dict
                        xfce4-screensaver
                        xfce4-power-manager
                        xfce4-clipman-plugin
                        xfce4-pulseaudio-plugin
                ];
        };
}
