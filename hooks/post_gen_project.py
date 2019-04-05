import os
import sys

config_path = os.path.join(os.getenv("HOME"), ".jupyter/jupyter_notebook_config.py")
template_path = os.path.join(os.getcwd(), 'config/')

with open(config_path, 'a') as file:
    file.write("c.JupyterLabTemplates.include_default = False\n")
    file.write('c.JupyterLabTemplates.template_dirs = ["' + str(template_path) + '"]\n')

#cd ${{cookiecutter.project_name}}
#cd config/

#echo "$PWD"
#template_path=$PWD
#cd $HOME/.jupyter

#echo "c.JupyterLabTemplates.template_dirs = ["$template_path"]" >> jupyter_notebook_config.py
#exit 0
#echo "c.JupyterLabTemplates.include_default = False" >> jupyter_notebook_config.py