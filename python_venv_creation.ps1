# script to  create a standard git directory sturcutre
# create a python venv, and upgrade pip
# expects $path\repo_init_files\.gitignore and README to exist
# TODO: figger out directory structure and update, update files
# add existence checks/graceful exit
# make it download latest python build?

$proj_name = "test_script"    # add project name
$path = "add_directory_for_project"  # add directory name
New-Item -ItemType directory -Path $path\$proj_name\$proj_name
New-Item -ItemType directory -Path $path\$proj_name\tests
Copy-Item "$path\repo_init_files\.gitignore" -Destination "$path\$proj_name"
Copy-Item "$path\repo_init_files\README.md" -Destination "$path\$proj_name"
New-Item $path\$proj_name\$proj_name\__init__.py
New-Item $path\$proj_name\tests\__init__.py
cd $path\$proj_name
python -m venv venv
cd $path\$proj_name\venv
scripts\Activate
pip install black flake8 sphinx pytest
python -m pip install --upgrade pip
pip freeze > requirements.txt
Move-Item -Path $path\$proj_name\venv\requirements.txt -Destination $path\$proj_name\requirements.txt
git init 

Read-Host -Prompt "Complete, Press Enter to Exit"
