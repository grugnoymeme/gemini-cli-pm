<div align="center">

<pre>
<font color="#87CEEB"> ███          █████████  ████████   ████     ████ █████ ██████   █████ █████</font>
<font color="#94B8D7"> ░░░███       ███░░░░██  ███░░░░█░░ █████   █████ ░░███ ░░██████ ░░███ ░░███</font>
<font color="#A1A3C4">   ░░░███     ███      ░░███  █ ░  ░███░█████░███  ░███  ░███░███ ░███  ░███</font>
<font color="#AE8DB0">     ░░░███  ░███       ░██████    ░███░░███ ░███  ░███  ░███░░███░███  ░███</font>
<font color="#BB789D">      ███░   ░███  █████ ███░░█    ░███ ░░░  ░███  ░███  ░███ ░░██████  ░███</font>
<font color="#C86289">    ███░    ░░███ ░░███ ░███ ░  █  ░███      ░███  ░███  ░███  ░░█████  ░███</font>
<font color="#D54D76"> ███░       ░░█████████  ████████  █████      █████ █████ █████  ░░█████ █████</font>
<font color="#BE5A5A"> ░░░          ░░░░░░░░░ ░░░░░░░░░░ ░░░░░      ░░░░░ ░░░░░ ░░░░░    ░░░░░ ░░░░░</font>
</pre>
<h1>Gemini Project Manager (GPM)</h1>
<p>
  <strong>A smart manager for your Gemini-CLI projects. Built to streamline your workflow, one project at a time.</strong>
</p>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.2-blue.svg?cacheSeconds=2592000" />
  <img alt="GitHub" src="https://img.shields.io/badge/author-@grugnoymeme-blueviolet.svg" />
  <img alt="License" src="https://img.shields.io/badge/license-MIT-green.svg" />
</p>

</div>

---

## ✨ Introduction

**Gemini Project Manager (GPM)** is an interactive shell script designed to wrap the official `gemini-cli`, offering a more structured and organized user experience. Tired of launching `gemini` from the same folder every time? Want to keep your projects separate, each with its own history and context? GPM is the solution.

On startup, GPM allows you to:
- **Create a new project** in a dedicated directory.
- **Choose an existing project** from an auto-generated list.
- **Work in the main (root) folder** that contains all your projects.

Once the context is selected, GPM launches `gemini-cli` in that specific directory, keeping everything neat and tidy.

## 🚀 Installation and Setup

Follow these steps to get GPM up and running in minutes.

### 1. Download the Script

Clone this repository or download the `gpm_github.sh` script directly into your preferred folder.

```bash
# Clone the repository (recommended)
git clone https://github.com/grugnoymeme/gemini-cli-pm.git

# Enter the directory
cd gemini-cli-pm
```

### 2. Make the Script Executable

You need to give the script execution permissions.

```bash
chmod +x gc_pm.sh
```

### 3. Customize the Script

Open the `gc_pm.sh` file with your favorite text editor (e.g., `nano`, `vim`, `micro`, `vscode`). There are **three sections** you absolutely must modify.

<br>

<details>
<summary><strong>1️⃣ Set Your Root Directory</strong></summary>
<br>

Look for the `GEMINI_PROJECTS_ROOT` variable. This is the **absolute** path to the folder that will contain all your project subfolders.

**How to do it:**
1.  Create a folder wherever you like (e.g., `~/Documents/GeminiProjects`).
2.  Replace the default value with the path to that folder.

```bash
# Example of how the modified line should look:
GEMINI_PROJECTS_ROOT="/home/your_user/Documents/GeminiProjects"
```
</details>

<details>
<summary><strong>2️⃣ Enter Your API Key</strong></summary>
<br>

Find the `export GEMINI_API_KEY` line. Here you need to insert your Google Gemini API key.

```bash
# Replace <your_gemini_API_key_here> with your personal key
export GEMINI_API_KEY="aAbBcC123dDeEfF456gGhHiI789..."
```
</details>

<details>
<summary><strong>3️⃣ Set the Gemini Executable Path</strong></summary>
<br>

The final modification is the path to the `gemini-cli` executable. To find it, open a terminal and type:

```bash
which gemini
```

The command will return a path, for example `/home/your_user/.nvm/versions/node/v20.11.0/bin/gemini`. Copy this path and paste it at the end of the script.

```bash
# Replace the example line with the path obtained from 'which gemini'
/home/your_user/.nvm/versions/node/v20.11.0/bin/gemini
```
</details>

<br>

**Done!** You are now ready to use GPM.

## 🎮 Usage

To start the manager, simply run the script from your terminal:

```bash
./gc_pm.sh
```

You will be presented with a welcome screen and asked if you want to create a new project.
- **Create a new project:** Answer `y` and enter a name. GPM will create a new folder and navigate into it.
- **Choose an existing project:** Answer `n`. GPM will list all the folders in your `GEMINI_PROJECTS_ROOT`, plus an option to stay in the root itself. Select the corresponding number and press Enter.

## 🌟 Tips & Tricks (Advanced Usage)

To integrate GPM even better into your system, here are two tips.

### Terminal Alias

Tired of typing `./gpm_github.sh` every time? Create an alias! This way, when you type `gemini` in the terminal, GPM will start instead of the standard client.

1.  Open your shell's configuration file (`.zshrc` for Zsh, `.bashrc` for Bash).
    ```bash
    # For Zsh
    nano ~/.zshrc

    # For Bash
    nano ~/.bashrc
    ```
2.  Add the following line to the end of the file, making sure to use the **absolute path** to your script.
    ```bash
    alias gemini="/absolute/path/to/gc_pm.sh"
    ```
    Example: `alias gemini="/home/emanuele/gemini-cli-pm/gc_pm.sh"`
3.  Save the file and reload your shell configuration.
    ```bash
    # For Zsh
    source ~/.zshrc

    # For Bash
    source ~/.bashrc
    ```
Now, whenever you type `gemini`, the Project Manager will start!

### Creating a `.desktop` Launcher (Linux)

If you use a Linux desktop environment, you can create a launcher to start GPM directly from your application menu.

1.  Create a new file with a `.desktop` extension, for example `gemini-pm.desktop`.
    ```bash
    nano ~/.local/share/applications/gemini-pm.desktop
    ```
2.  Paste the following content into the file, modifying the `Exec` and `Path` fields with your absolute paths.

    ```ini
    [Desktop Entry]
    Version=1.0
    Name=Gemini Project Manager
    Comment=Manager for Gemini-CLI projects
    Exec=mate-terminal -- /bin/zsh -c "/absolute/path/to/gc_pm.sh; exec zsh"
    Icon=utilities-terminal
    Terminal=false
    Type=Application
    Categories=Development;Utility;
    Path=/absolute/path/to/the/script/folder/
    ```
    > **Note:** `Exec` launches a new terminal (`mate-terminal` in this example, you may need to change it to `konsole`, `xfce4-terminal`, etc.) that runs the script. Adding `exec zsh` at the end keeps the terminal open after Gemini closes.

3.  Save the file. You should now find "Gemini Project Manager" in your application menu!

---

<div align="center">
  <p><strong>Disclaimer:</strong> This is a personal utility, not an official Google tool, provided to streamline the user experience with the original Gemini CLI.</p>
  <p>Made with ❤️ by <a href="https://github.com/grugnoymeme">grugnoymeme</a></p>
</div>
