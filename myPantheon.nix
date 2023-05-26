#       Data: 17/09/2022
#       Computador: 'NEPTUNE' - Laptop
#       Nome do arquivo: 'myPantheon.nix'
#       Autor: Pedro Igor Martins dos Reis (@pedroigorreis

{ config, pkgs, ... }:

{
        services =
        {
                xserver =
                {
                        layout = "br";
                        enable = true;
                        videoDrivers = [ "amdgpu" ];
                        desktopManager.pantheon.enable = true;
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
                ];
        };
}
