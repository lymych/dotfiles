from pathlib import Path
from pyinfra import host
from pyinfra.facts.server import Home

cwd_path = Path.cwd()
home_path = host.get_fact(Home)
config_path = f"{home_path}/.config"
projects_path = f"{home_path}/Projects"
sandbox_path = f"{home_path}/Sandbox"
personal_projects_path = f"{projects_path}/Personal"
work_projects_path = f"{projects_path}/Work"
notes_path = f"{personal_projects_path}/Notes"
