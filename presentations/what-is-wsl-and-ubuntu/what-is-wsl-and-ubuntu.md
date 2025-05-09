---
marp: true
theme: devslopes
paginate: true
footer: "Devslopes Software Setup - WSL & Ubuntu"
---

<!-- _class: title -->
# What is WSL and Ubuntu
## Devslopes Software Setup

---

# What We Are Going to Cover

- **What is WSL**
- **What is Ubuntu**
- **Why are we using WSL & Ubuntu**

---

# What is WSL

- WSL stands for Windows Subsystem Linux
- Enables running a Linux environment directly on Windows

---

# What is Ubuntu

- Ubuntu is a Linux Distribution
- It is the default version for WSL
- Widely used and well-documented
- Lots of supported software and packages
- A stable point to be learning Linux

---

# Why are we using WSL & Ubuntu

- WSL allows us to avoid using true Virtual Machines and/or "Dual Booting"
- Allows access to linux based tools and command line utilities
- Develop and test using Linux environment while having Windows system access also

---

# Benefits of WSL & Ubuntu

- Seamless integration with Windows
- Run Linux commands and applications alongside Windows apps
- File system interoperability between Windows and Linux
- Ideal for developers and system administrators

---

# Installing WSL - Step 1

- Open Windows Terminal as an administrator
- Run the following command:

```powershell
wsl --install
```

**Note**: This should automatically start an Ubuntu session for user setup

---

# Installing WSL - Step 2

- Set up your default Unix user
- Create a username that's easy to remember
- Doesn't need to match your Windows username
- Set a password you'll remember (password field won't show characters)

---

# Installing WSL - Step 3

- Verify your WSL version:

```powershell
wsl --status
```

- Ensure you're on version 2
- If not on version 2, follow the troubleshooting steps

---

# Installing WSL - Step 4

- Restart your computer to finish installation
- All further commands will be run in the Ubuntu terminal

---

# Ubuntu Terminal Setup

- Open the Ubuntu application (orange circular icon) as administrator
- Configure copy/paste:
  - Right-click the top of your Ubuntu window
  - Go to Properties
  - Check "use Ctrl + Shift + C/V as Copy/Paste"

---

# Installing Essential Packages - Step 1

- Update available software:

```bash
sudo apt update
```

- Upgrade installed packages:

```bash
sudo apt upgrade
```

---

# Installing Essential Packages - Step 2

- Install useful development packages:

```bash
sudo apt install zsh unzip git
```

- Change default shell to zsh:

```bash
chsh -s $(which zsh)
```

- Restart Ubuntu (close and reopen)
- At the first zsh prompt, press 0

---

# Setting up VSCode Integration

- Install the WSL extension in VSCode
  - Made by Microsoft
  - Has over 20M downloads
- This enables VSCode to work directly with your WSL environment

---

# Verifying Your Setup

- To test if VSCode integration worked:
  - Open Ubuntu terminal
  - Run:

```bash
which code
```

- If it shows a path (not "command not found"), your setup is complete! ✅

---

# Resources

- Video tutorials:
  - [WSL Installation Process](https://www.loom.com/share/7dab16c5803f4af5abf6dc24efd51749?sid=a100f5ef-0acd-4044-b514-bfca17ae8c3d)
  - [WSL Customization Process](https://www.loom.com/share/b533a79f291842439d9f23b7c3805327?sid=cb4661c1-1d95-4a7d-b98a-1aa434034f84)

---

# Troubleshooting

- If you forget your Unix user password:
  - Follow the reset instructions in the GitHub documentation
- If you encounter WSL2 configuration issues:
  - See the troubleshooting steps in the documentation

---
