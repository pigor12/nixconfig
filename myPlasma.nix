#       Data: 17/09/2022
#       Computador: 'NEPTUNE' - Laptop
#       Nome do arquivo: 'myPlasma.nix'
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
                                sddm =
                                {
                                        settings =
                                        {
                                                Theme =
                                                {
                                                        Font = "Ubuntu";
                                                        CursorTheme = "Breeze_Snow";
                                                };
                                                Wayland =
                                                {
                                                        EnableHiDPI = "true";
                                                };
                                        };                                
                                        enable = true;
                                };
                                defaultSession = "plasmawayland";
                        };
                        desktopManager =
                        {
                                plasma5 =
                                {
                                        enable = true;
                                        useQtScaling = true;
                                        runUsingSystemd = true;
                                };
                        };
                        videoDrivers = [ "amdgpu" ];
                };
        };

        environment =
        {
                sessionVariables =
                {
                        MOZ_ENABLE_WAYLAND="1";
                        _JAVA_AWT_WM_NONREPARENTING = "1";
                };
                systemPackages = with pkgs; with libsForQt5;
                [
                        # Miscellaneous
                        xz
                        git
                        unzip
                        aspellDicts.pt_BR

                        # Work
                        jdk8
                        firefox

                        # Plasma
                        ark
                        kate
                        kcalc
                        haruna
                        kwrited
                        ktorrent
                        gwenview
                        spectacle
                ];
        };
}
