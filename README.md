# Arquivos de configuração - [NixOS](https://nixos.org/)

Configurações para os ambientes KDE Plasma, Xfce e Pantheon, reproduzível em diversos ambientes.

* `configuration.nix` → Contém as configurações básicas, como inicialização do sistema operacional, drivers de vídeo (`dri`) e som (`pipewire`), aceleração por hardware (`vaapi`) etc;
* `hardware-configuration.nix` → Informação de dispositivos carregados pelo kernel, gerado pelo próprio `nix-install`;
* `myPantheon.nix` → Contém as configurações para o ambiente gráfico Pantheon do [Elementary OS](https://elementary.io/pt_BR/), com objetivo de torná-lo mais minimalista;
* `myPlasma.nix` → Contém as configurações para o ambiente gráfico [KDE Plasma](https://kde.org/plasma-desktop/), com objetivo de priorizar a sessão Wayland;
* `myXfce.nix` → Contém as configurações para o ambiente gráfico [Xfce](https://xfce.org/), com o objetivo de torná-lo mais completo para meu fluxo de trabalho.
