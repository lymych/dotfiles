from pyinfra.operations import brew, files, git, server
from common import (
    projects_path,
    personal_projects_path,
    work_projects_path,
    home_path,
    notes_path,
    cwd_path,
    sandbox_path,
    config_path,
)


def setup_tmux():
    git.repo(
        src="https://github.com/tmux-plugins/tpm", dest=f"{home_path}/.tmux/plugins/tpm"
    )
    files.directory(path=f"{config_path}/tmux", present=True)
    files.link(path=f"{home_path}/.tmux.conf", target=f"{cwd_path}/tmux.conf")
    server.shell(
        commands=[
            f"tmux new-session -d -s temp {home_path}/.tmux/plugins/tpm/bin/install_plugins",
        ]
    )


def setup_base_dirs():
    for path in [
        projects_path,
        personal_projects_path,
        work_projects_path,
        sandbox_path,
    ]:
        files.directory(
            path=path,
            present=True,
        )


def setup_gitconfig():
    files.file(path=f"{work_projects_path}/.gitconfig")
    files.file(path=f"{personal_projects_path}/.gitconfig")
    files.link(path=f"{home_path}/.gitconfig", target=f"{cwd_path}/gitconfig")


def setup_notes():
    git.repo(
        src="https://github.com/lymych/vault-ops.git",
        dest=notes_path,
        branch="uat",
        rebase=True,
    )


def setup_links():
    files.directory(path=config_path, present=True)
    files.link(path=f"{config_path}/nvim", target=f"{cwd_path}/nvim")
    files.link(path=f"{config_path}/alacritty", target=f"{cwd_path}/alacritty")
    files.link(path=f"{config_path}/wezterm", target=f"{cwd_path}/wezterm")


def setup_zsh():
    files.link(path=f"{home_path}/.zshenv", target=f"{cwd_path}/zsh/zshenv")
    files.link(path=f"{home_path}/.zshrc", target=f"{cwd_path}/zsh/zshrc")
    files.link(path=f"{home_path}/.p10k.zsh", target=f"{cwd_path}/zsh/p10k.zsh")


def setup_mac_brew():
    brew.packages(
        packages=[
            "curl",
            "ffmpeg",
            "python",
            "rust",
            "wget",
            "awscli",
            "bat",
            "duckdb",
            "fd",
            "fzf",
            "gh",
            "go",
            "go-task",
            "hadolint",
            "helm",
            "httpie",
            "jq",
            "k9s",
            "kubectx",
            "lua",
            "neovim",
            "node",
            "perl",
            "pre-commit",
            "ripgrep",
            "sqlite",
            "terraform-docs",
            "tflint",
            "tfsec",
            "tfswitch",
            "tgswitch",
            "tmux",
            "yazi",
            "yq",
            "zoxide",
        ],
    )
    brew.casks(
        casks=[
            "alacritty",
            "appcleaner",
            "betterdisplay",
            "bruno",
            "cyberduck",
            "dbeaver-community",
            "drawio",
            "font-jetbrains-mono-nerd-font",
            "font-meslo-lg-nerd-font",
            "iina",
            "jetbrains-toolbox",
            "keystore-explorer",
            "obsidian",
            "raycast",
            "session-manager-plugin",
            "syncthing",
            "visual-studio-code",
            "wezterm",
            "zed",
            # "zoom",
            # "postman",
            # "pgadmin4",
            # "offset-explorer",
            # "lens",
            # "burp-suite",
            # "telegram",
            # "google-chrome",
        ],
    )


setup_mac_brew()
setup_tmux()
setup_base_dirs()
setup_gitconfig()
setup_notes()
setup_links()
setup_zsh()
