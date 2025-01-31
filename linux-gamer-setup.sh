#!/bin/bash

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
flatpak update -y

echo "Adicionando o repositório Flathub..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instalação das lojas de jogos
confirm_install "Steam" && flatpak install -y flathub com.valvesoftware.Steam
confirm_install "Lutris" && flatpak install -y flathub net.lutris.Lutris
confirm_install "Heroic Game Launcher" && flatpak install -y flathub com.heroicgameslauncher.hgl
confirm_install "Bottles" && flatpak install -y flathub io.github.usebottles.bottles

# Instalação de ferramentas Wine
confirm_install "Wine" && flatpak install -y flathub org.winehq.Wine

# Instalação de ferramentas de otimização
confirm_install "CoreCtrl (controle da ventoinha da GPU)" && flatpak install -y flathub org.corectrl.CoreCtrl
confirm_install "MangoHud (overlay de desempenho)" && flatpak install -y flathub org.freedesktop.Platform.VulkanLayer.MangoHud

# Instalação de VkBasalt, GOverlay, e obs-vkcapture (com alternativas para instalação)
confirm_install "VkBasalt (filtro de pós-processamento para Vulkan)" && {
    echo "Instalando VkBasalt..."
    if command -v apt &> /dev/null; then
        apt install -y vkbasalt
    elif command -v dnf &> /dev/null; then
        dnf install -y vkbasalt
    elif command -v pacman &> /dev/null; then
        pacman -S --noconfirm vkbasalt
    elif command -v zypper &> /dev/null; then
        zypper install -y vkbasalt
    else
        echo "Gerenciador de pacotes não suportado. Instale o VkBasalt manualmente."
    fi
}

confirm_install "GOverlay (configuração do MangoHud e VkBasalt)" && {
    echo "Instalando GOverlay..."
    if command -v apt &> /dev/null; then
        apt install -y goverlay
    elif command -v dnf &> /dev/null; then
        dnf install -y goverlay
    elif command -v pacman &> /dev/null; then
        pacman -S --noconfirm goverlay
    else
        echo "Gerenciador de pacotes não suportado. Instale o GOverlay manualmente."
    fi
}

confirm_install "obs-vkcapture (captura Vulkan para OBS Studio)" && {
    echo "Instalando obs-vkcapture..."
    if command -v apt &> /dev/null; then
        apt install -y obs-vkcapture
    elif command -v dnf &> /dev/null; then
        dnf install -y obs-vkcapture
    elif command -v pacman &> /dev/null; then
        pacman -S --noconfirm obs-vkcapture
    else
        echo "Gerenciador de pacotes não suportado. Instale o obs-vkcapture manualmente."
    fi
}

# Instalação de ferramentas de criação de conteúdo
confirm_install "Kdenlive" && flatpak install -y flathub org.kde.kdenlive
confirm_install "OBS Studio" && flatpak install -y flathub com.obsproject.Studio
confirm_install "GIMP (editor de imagem)" && flatpak install -y flathub org.gimp.GIMP

# Instalação do GameMode (universal)
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
    echo "export DXVK_FILTER_DEVICE_NAME=AMD" >> /etc/environment
    echo "export RADV_PERFTEST=aco" >> /etc/environment
    echo "export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json" >> /etc/environment
elif [ "$gpu_choice" == "2" ]; then
    echo "Configurando otimizações para NVIDIA..."
    echo "export DXVK_FILTER_DEVICE_NAME=NVIDIA" >> /etc/environment
    echo "export __GL_THREADED_OPTIMIZATIONS=1" >> /etc/environment
    echo "export __GL_SHADER_DISK_CACHE=1" >> /etc/environment
    echo "export __GL_SHADER_DISK_CACHE_PATH=$HOME/.nv/ShaderCache" >> /etc/environment
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
