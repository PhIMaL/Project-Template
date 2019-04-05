import os
import sys

config_path = os.path.join(os.getenv("HOME"), ".jupyter/jupyter_notebook_config.py")
template_path = os.path.join(os.getcwd(), 'config/templates/')

with open(config_path, 'a') as file:
    file.write("c.JupyterLabTemplates.include_default = False\n")
    file.write('c.JupyterLabTemplates.template_dirs = ["' + str(template_path) + '"]\n')
