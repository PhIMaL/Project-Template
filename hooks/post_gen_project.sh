cd {{cookiecutter.project_name}}/config

template_path=$PWD
cd $HOME/.jupyter

echo "c.JupyterLabTemplates.template_dirs = ["$template_path"]" >> jupyter_notebook_config.py
echo "c.JupyterLabTemplates.include_default = False" >> jupyter_notebook_config.py