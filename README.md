# Linux Gamer Setup

Este repositório contém um script para transformar qualquer distribuição Linux em uma máquina gamer com pacotes Flatpak.

## Como usar:
1. Baixe o repositório.
2. Execute o script `linux-gamer-setup.sh` no terminal.
3. Siga as instruções interativas.

## Ferramentas instaladas:
- Steam
- Lutris
- Heroic Game Launcher
- E muito mais...

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

# Antes de instalar o script, certifique-se de que tem o flatpak instalado e o repositório Flathub, caso não tenha, siga estes passos:

---

### **1. Instalar o Flatpak no Linux**

O processo de instalação pode variar um pouco dependendo da sua distribuição. Vou te passar os comandos para as distribuições mais comuns. 

#### **Se você estiver usando Ubuntu ou Debian (ou derivados como Linux Mint, Pop!_OS, etc.):**

1. Abra o terminal e execute o seguinte comando para instalar o Flatpak:

   ```bash
   sudo apt update
   sudo apt install flatpak
   ```

#### **Se você estiver usando Fedora:**

1. O Fedora já vem com o Flatpak, mas caso precise reinstalar, use o comando:

   ```bash
   sudo dnf install flatpak
   ```

#### **Se você estiver usando Arch Linux ou Manjaro:**

1. Para instalar o Flatpak, use:

   ```bash
   sudo pacman -S flatpak
   ```

---

### **2. Adicionar o Repositório Flathub**

Após instalar o Flatpak, você também vai precisar adicionar o repositório **Flathub**, que é onde estão os aplicativos em Flatpak. Execute o seguinte comando para adicionar o Flathub:

```bash
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

---

### **Feito isso, já pode seguir com os passos abaixo.**

---
### **1. Clonar o Repositório do GitHub para o Seu Computador**

Primeiro, você precisa ter o repositório clonado no seu computador. Para isso, siga esses passos:

1. **Abra o Terminal** no seu computador.

2. **Clone o Repositório**:
   No terminal, navegue até o diretório onde você quer clonar o repositório e execute o seguinte comando:
   
   ```bash
   git clone https://github.com/Sudosu32/linux-gamer-setup
   ```

   Esse comando vai baixar o repositório e colocar ele em uma pasta chamada `linux-gamer-setup`.

3. **Entre na Pasta do Repositório**:
   Agora, entre no diretório do repositório clonado com o comando:

   ```bash
   cd linux-gamer-setup
   ```

---

### **2. Tornar o Script Executável**

Antes de rodar o script, você precisa garantir que ele tenha permissões de execução. Para fazer isso, siga o passo abaixo:

1. **Mude as permissões do script**:
   Execute o seguinte comando no terminal para tornar o script `linux-gamer-setup.sh` executável:

   ```bash
   chmod +x linux-gamer-setup.sh
   ```

   Esse comando vai permitir que o script seja executado diretamente no seu terminal.

---

### **3. Executar o Script**

Agora que você já tem o script com permissão de execução, pode rodá-lo no terminal. Para isso, siga os passos:

1. **Execute o Script**:
   No terminal, dentro da pasta onde o repositório foi clonado, execute o script com o comando:

   ```bash
   sudo ./linux-gamer-setup.sh
   ```

2. **Siga as Instruções Interativas**:
   O script pode pedir para você escolher algumas opções, como se deseja instalar determinados programas ou pacotes. Se o script tiver opções interativas, basta seguir as instruções que aparecem no terminal.

---

### **4. Acompanhando o Processo**

Enquanto o script estiver sendo executado, o terminal vai mostrar o andamento da instalação e as opções selecionadas. Dependendo da configuração do seu sistema e da quantidade de pacotes a serem instalados, o processo pode demorar um pouco.

Se você precisar sair do terminal ou interromper o script por algum motivo, você pode pressionar `Ctrl + C` para cancelar a execução.

---

### **5. Após a Execução do Script**

Depois de o script terminar, as ferramentas e programas selecionados serão instalados no seu sistema. Caso tenha escolhido a opção de atualizar drivers ou fazer outras modificações, elas também terão sido aplicadas.

Agora, você pode começar a usar o sistema com as ferramentas que o script instalou, como o **Steam**, **Lutris**, **Heroic Game Launcher**, entre outras.



---

Todo esse processo foi criado com o auxílio do **ChatGPT** e editado para facilitar ainda mais o passo a passo.  
Se você pretende criar algum conteúdo com base neste script ou tutorial, **por favor, dê os créditos** para reconhecer o trabalho duro de quem testou em várias distros antes de compartilhar!  

**Créditos para:** NeotrixSU  
**Canal no YouTube:** [NeotrixSU](https://www.youtube.com/@neotrixsu)  

Sou apenas um entusiasta e amador, mas com muita força de vontade para ajudar a comunidade Linux! 🐧✨  

---

😊 ;-) 
