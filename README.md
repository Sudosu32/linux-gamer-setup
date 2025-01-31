

# Linux Gamer Setup

Este repositório contém um script para transformar qualquer distribuição Linux em uma máquina gamer utilizando apenas pacotes Flatpak.

## Como usar:

1. Baixe o repositório.
2. Execute o script `linux-gamer-setup.sh` no terminal.
3. Siga as instruções interativas.

## Ferramentas instaladas:

- **Steam**: Plataforma de distribuição digital para jogos, permite jogar títulos nativos para Linux e usar o Proton para rodar jogos Windows no Linux.
- **Lutris**: Plataforma de gerenciamento de jogos para Linux que suporta nativos, emuladores e jogos via Wine, Proton e outros.
- **Heroic Game Launcher**: Cliente de código aberto para Epic Games Store e GOG, permitindo rodar jogos desses serviços no Linux.
- **Wine**: Implementação de uma camada de compatibilidade que permite rodar aplicativos Windows no Linux.
- **WineZGUI**: Interface gráfica para o Wine, facilitando a configuração e instalação de jogos e programas Windows no Linux.
- **ProtonUp-Qt**: Ferramenta para gerenciar e instalar versões do Proton, que permite rodar jogos Windows via Steam no Linux.
- **Protontricks**: Ferramenta para configurar o Proton e Wine de forma mais avançada, permitindo ajustes em jogos individuais.
- **MangoHud**: Ferramenta de monitoramento de desempenho em jogos, exibindo informações como FPS, uso de CPU, GPU e RAM.
- **RPCS3**: Emulador de PlayStation 3 para Linux, permitindo rodar jogos de PS3 no seu PC.
- **mGBA**: Emulador de Game Boy Advance, permitindo jogar títulos dessa plataforma no Linux.
- **PPSSPP**: Emulador de PlayStation Portable (PSP), permitindo jogar títulos de PSP no Linux.
- **PCSX2**: Emulador de PlayStation 2, permitindo rodar jogos dessa plataforma no Linux.
- **DuckStation**: Emulador de PlayStation, focado na emulação de alta performance e compatibilidade com jogos PS1.
- **GeForce NOW Electron**: Cliente de streaming de jogos da NVIDIA, permitindo rodar jogos na nuvem utilizando a infraestrutura da NVIDIA.
- **AntiMicroX**: Ferramenta para mapear teclados e controles para qualquer tecla ou ação no Linux, útil para configurar joysticks e gamepads.

---

# **Transforme seu Linux em uma Distribuição Gamer**

Este guia ensina como criar um ponto de restauração no Linux antes de aplicar modificações no sistema e, em seguida, como usar um script para transformar qualquer distribuição Linux em uma distribuição gamer com pacotes Flatpak.

## **1. Criando um Ponto de Restauração no Linux**

Antes de executar qualquer script de otimização, é altamente recomendado criar um backup do sistema.

### **1.1 Criando um Backup com Timeshift**

O Timeshift é uma ferramenta que permite criar snapshots do sistema, possibilitando a restauração em caso de problemas.

### **Instalando o Timeshift**

Para instalar o Timeshift, utilize um dos seguintes comandos conforme a sua distribuição:

- **Debian, Ubuntu, Linux Mint**:
  ```bash
  sudo apt install timeshift -y
  ```

- **Fedora**:
  ```bash
  sudo dnf install timeshift -y
  ```

- **Arch Linux, Manjaro**:
  ```bash
  sudo pacman -S timeshift
  ```

### **Criando um Snapshot**

1. Abra o Timeshift:
   ```bash
   sudo timeshift-launcher
   ```

2. Escolha o tipo de snapshot (RSYNC recomendado).

3. Selecione a partição onde será armazenado o backup.

4. Clique em "Criar" e aguarde o processo.

5. Caso precise restaurar, basta acessar o Timeshift novamente e selecionar o snapshot desejado.

---

# **Antes de instalar o script, certifique-se de que tem o Flatpak instalado e o repositório Flathub.**

### **1. Instalar o Flatpak no Linux**

#### **Debian, Ubuntu, Linux Mint e derivados:**
```bash
sudo apt update
sudo apt install flatpak
```

#### **Fedora:**
```bash
sudo dnf install flatpak
```

#### **Arch Linux, Manjaro:**
```bash
sudo pacman -S flatpak
```

### **2. Adicionar o Repositório Flathub**

```bash
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

---

### **1. Clonar o Repositório do GitHub para o Seu Computador**

1. Abra o Terminal e execute:
   ```bash
   git clone https://github.com/Sudosu32/linux-gamer-setup
   ```

2. Entre na pasta do repositório:
   ```bash
   cd linux-gamer-setup
   ```

---

### **2. Tornar o Script Executável**

1. Conceda permissão de execução ao script:
   ```bash
   chmod +x linux-gamer-setup.sh
   ```

---

### **3. Executar o Script**

1. Execute o script:
   ```bash
   sudo ./linux-gamer-setup.sh
   ```

2. Siga as instruções interativas no terminal.

---

### **4. Acompanhando o Processo**

Durante a execução, o terminal mostrará o progresso da instalação. Para interromper, pressione `Ctrl + C`.

---

### **5. Após a Execução do Script**

Depois da instalação, os programas estarão prontos para uso.

---

Todo esse processo foi criado com o auxílio do **ChatGPT** e editado para facilitar ainda mais o passo a passo.  
Se você pretende criar algum conteúdo com base neste script ou tutorial, **por favor, dê os créditos** para reconhecer o trabalho de quem testou em várias distros antes de compartilhar!

**Créditos para:** NeotrixSU  
**Canal no YouTube:** [NeotrixSU](https://www.youtube.com/@neotrixsu)

Sou apenas um entusiasta e amador, mas com muita força de vontade para ajudar a comunidade Linux! 🐧✨
