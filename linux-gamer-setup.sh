#!/bin/bash

# Função para verificar se o Flatpak está instalado
check_flatpak() {
  if ! command -v flatpak &> /dev/null
  then
    echo "Flatpak não encontrado! Instalando..."
    # Instalar Flatpak
    if [ -f /etc/debian_version ]; then
        sudo apt update && sudo apt install flatpak -y
    elif [ -f /etc/fedora-release ]; then
        sudo dnf install flatpak -y
    elif [ -f /etc/arch-release ]; then
        sudo pacman -S flatpak
    fi
  fi
}

# Função para adicionar o repositório Flathub
add_flathub_repo() {
  echo "Adicionando o repositório Flathub..."
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

# Função para instalar o pacote via Flatpak
install_flatpak() {
  package=$1
  echo "Deseja instalar $package? (s/n): "
  read -r install
  if [[ "$install" =~ ^[Ss]$ ]]; then
    sudo flatpak install flathub "$package" -y
  fi
}

# Função para configurar a GPU
configure_gpu() {
  echo "Escolha sua GPU:"
  echo "1 - AMD"
  echo "2 - NVIDIA"
  read -p "Digite o número correspondente: " gpu_choice
  if [ "$gpu_choice" == "1" ]; then
    echo "Configurando otimizações para AMD..."
    echo "Comandos para otimizar jogos na Steam:"
    echo "Para ativar MangoHud em um jogo, adicione no 'Opções de Inicialização' da Steam:"
    echo "MANGOHUD=1 gamemoderun %command%"
    echo "Comando para ativar o Vulkan Async (apenas AMD):"
    echo "RADV_PERFTEST=aco %command%"
  elif [ "$gpu_choice" == "2" ]; then
    echo "Configurando otimizações para NVIDIA..."
    echo "Comando para otimizar DXVK para NVIDIA:"
    echo "DXVK_ASYNC=1 __GL_SHADER_DISK_CACHE=1 %command%"
  fi
}

# Função principal do script
main() {
  echo "Atualizando e carregando repositórios..."
  sudo flatpak update -y

  # Verifica e instala o Flatpak
  check_flatpak

  # Adiciona o repositório Flathub
  add_flathub_repo

  # Instala os jogos e ferramentas necessários
  install_flatpak com.valvesoftware.Steam
  install_flatpak net.lutris.Lutris
  install_flatpak com.heroicgameslauncher.hgl
  install_flatpak com.github.Matoking.protontricks
  install_flatpak org.freedesktop.Platform.VulkanLayer.MangoHud
  install_flatpak net.rpcs3.RPCS3
  install_flatpak io.mgba.mGBA
  install_flatpak org.ppsspp.PPSSPP
  install_flatpak net.pcsx2.PCSX2
  install_flatpak org.duckstation.DuckStation
  install_flatpak io.github.hmlendea.geforcenow-electron
  install_flatpak io.github.antimicrox.antimicrox

  # Instalar o GameMode
  echo "Instalando o GameMode..."
  if [ -f /etc/debian_version ]; then
    sudo apt install gamemode -y
  elif [ -f /etc/fedora-release ]; then
    sudo dnf install gamemode -y
  elif [ -f /etc/arch-release ]; then
    sudo pacman -S gamemode
  fi


  # Pergunta sobre a configuração da GPU
  configure_gpu

  echo "Configuração finalizada! Reinicie o sistema para aplicar todas as otimizações."
}

# Chama a função principal
main
