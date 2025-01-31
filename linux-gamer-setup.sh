#!/bin/bash

# Script criado por NeotrixSU, procure o canal no youtube!
# Verifica se o usuário é root
if [ "$EUID" -ne 0 ]; then
    echo "Este script precisa ser executado como root. Use: sudo ./linux-gamer-setup.sh"
    exit 1
fi

# Função para perguntar ao usuário antes de instalar
confirm_install() {
    read -p "Deseja instalar $1? (s/n): " choice
    case "$choice" in
        s|S ) return 0 ;;
        * ) return 1 ;;
    esac
}

echo "Atualizando o sistema..."
flatpak update --assumeyes

echo "Adicionando o repositório Flathub..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instalação das lojas de jogos
confirm_install "Steam" && flatpak install --assumeyes flathub com.valvesoftware.Steam
confirm_install "Lutris" && flatpak install --assumeyes flathub net.lutris.Lutris
confirm_install "Heroic Game Launcher" && flatpak install --assumeyes flathub com.heroicgameslauncher.hgl
confirm_install "Bottles" && flatpak install --assumeyes flathub com.usebottles.bottles

# Ferramentas Wine e Proton
confirm_install "Wine" && flatpak install --assumeyes flathub org.winehq.Wine
confirm_install "WineZGUI" && flatpak install --assumeyes flathub com.github.diddlesnaps.winezgui
confirm_install "ProtonUp-Qt" && flatpak install --assumeyes flathub net.davidotek.pupgui2
confirm_install "ProtonPlus" && flatpak install --assumeyes flathub com.github.Matoking.ProtonPlus
confirm_install "Protontricks" && flatpak install --assumeyes flathub com.github.FlorianBruhin.Protontricks

# Ferramentas de otimização
confirm_install "CoreCtrl (controle da ventoinha da GPU)" && flatpak install --assumeyes flathub org.corectrl.CoreCtrl
confirm_install "MangoHud (overlay de desempenho)" && flatpak install --assumeyes flathub org.freedesktop.Platform.VulkanLayer.MangoHud
confirm_install "GPU-Viewer" && flatpak install --assumeyes flathub com.robbertvivian.GPUViewer

# Instalação de emuladores
confirm_install "RPCS3 (PS3)" && flatpak install --assumeyes flathub net.rpcs3.RPCS3
confirm_install "mGBA (GBA)" && flatpak install --assumeyes flathub io.mgba.mGBA
confirm_install "PPSSPP (PSP)" && flatpak install --assumeyes flathub org.ppsspp.PPSSPP
confirm_install "PCSX2 (PS2)" && flatpak install --assumeyes flathub net.pcsx2.PCSX2
confirm_install "DuckStation (PS1)" && flatpak install --assumeyes flathub org.duckstation.DuckStation

# Outras ferramentas
confirm_install "GeForce NOW Electron" && flatpak install --assumeyes flathub io.github.hmlendea.geforcenow-electron
confirm_install "AntiMicroX (Mapeador de controle)" && flatpak install --assumeyes flathub io.github.antimicrox.antimicrox

# Instalação do GameMode
if confirm_install "GameMode (otimização automática de jogos)"; then
    if command -v gamemoded &> /dev/null; then
        echo "GameMode já está instalado."
    else
        if command -v apt &> /dev/null; then
            apt install -y gamemode
        elif command -v dnf &> /dev/null; then
            dnf install -y gamemode
        elif command -v pacman &> /dev/null; then
            pacman -S --noconfirm gamemode
        elif command -v zypper &> /dev/null; then
            zypper install -y gamemode
        else
            echo "Gerenciador de pacotes não suportado. Instale o GameMode manualmente."
        fi
    fi
fi

# Configuração do MangoHud
echo "Configurando MangoHud..."
mkdir -p ~/.config/MangoHud
cat > ~/.config/MangoHud/MangoHud.conf <<EOL
fps_limit=0
vsync=0
gpu_stats=1
cpu_stats=1
ram=1
frametime=1
temperature=1
gpu_temp=1
cpu_temp=1
time=1
position=top-right
EOL

# Otimizações de hardware
echo "Escolha sua GPU:"
echo "1 - AMD"
echo "2 - NVIDIA"
read -p "Digite o número correspondente: " gpu_choice

if [ "$gpu_choice" == "1" ]; then
    echo "Configurando otimizações para AMD..."
    echo "export DXVK_FILTER_DEVICE_NAME=AMD" >> ~/.profile
    echo "export RADV_PERFTEST=aco" >> ~/.profile
    echo "export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json" >> ~/.profile
elif [ "$gpu_choice" == "2" ]; then
    echo "Configurando otimizações para NVIDIA..."
    echo "export DXVK_FILTER_DEVICE_NAME=NVIDIA" >> ~/.profile
    echo "export __GL_THREADED_OPTIMIZATIONS=1" >> ~/.profile
    echo "export __GL_SHADER_DISK_CACHE=1" >> ~/.profile
    echo "export __GL_SHADER_DISK_CACHE_PATH=$HOME/.nv/ShaderCache" >> ~/.profile
else
    echo "Opção inválida. Nenhuma otimização de GPU aplicada."
fi

# Comandos úteis para Steam
echo "Comandos para otimizar jogos na Steam:"
echo 'Para ativar MangoHud em um jogo, adicione no "Opções de Inicialização" da Steam:'
echo '  MANGOHUD=1 gamemoderun %command%'
echo ""
echo "Comando para ativar o Vulkan Async (apenas AMD):"
echo '  RADV_PERFTEST=aco %command%'
echo ""
echo "Comando para otimizar DXVK para NVIDIA:"
echo '  DXVK_ASYNC=1 __GL_SHADER_DISK_CACHE=1 %command%'

echo "Configuração finalizada! Reinicie o sistema para aplicar todas as otimizações."
