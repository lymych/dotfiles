from pyinfra.operations import brew, git
from common import home_path


def update_mac_brew():
    brew.update()
    brew.upgrade()
    brew.cask_upgrade()


def update_git_repos():
    git.repo(
        src="https://github.com/lymych/dotfiles.git",
        dest=f"{home_path}/dotfiles",
        branch="uat",
        rebase=True,
        update_submodules=True,
    )


update_mac_brew()
update_git_repos()
