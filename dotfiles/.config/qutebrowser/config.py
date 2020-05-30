#!/usr/bin/env python

# Source Yaml File {{{
# This section manages the sourcing of a yaml file that holds the keybindings
# and simple settings. I prefer yaml to python commands for mass data entry
# like keybindings of simple settings decorations that require no greater
# logic.
import yaml

# Load the actual yaml config file
with open(config.configdir / 'config.yaml') as f:
    yaml_cfg = yaml.load(f, Loader=yaml.FullLoader)


# This function recursively gets . separated paths from nested yaml
def dict_attrs(obj, path=''):
    if isinstance(obj, dict):
        for k, v in obj.items():
            yield from dict_attrs(v, '{}.{}'.format(path, k) if path else k)
    else:
        yield path, obj


# The main script that parses the file
for type, content in yaml_cfg.items():
    if type == "settings":  # Declarative Settings
        for scope, content in content.items():
            # This loop separates global settings with site specific ones
            if scope == "global":
                for item, value in dict_attrs(content):
                    config.set(item, value)
            else:
                for item, value in dict_attrs(content):
                    config.set(item, value, scope)
    if type == "binds":  # Key Bindings
        for mode, content in content.items():
            # This loop only exists to declare the mode of the binding
            for key, action in content.items():
                if action:  # If the action exists, bind the key
                    config.bind(key, action, mode=mode)
                else:  # If there is no action, unbind said key.
                    config.unbind(key, mode=mode)
# }}}

# Colorscheme
config.source('base16-gruvbox-dark-hard.config.py')
