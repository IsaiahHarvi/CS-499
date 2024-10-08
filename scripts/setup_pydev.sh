#!/usr/bin/env bash

bash scripts/setup_common.sh


if command -v nvidia-smi &> /dev/null; then
    echo -e "\n\nInstalling GPU requirements"
    pip3 install --no-cache-dir --user -r .devcontainer/requirements.txt -e .
    bash scripts/get_data.sh # only the ML container needs the dataset
else
    echo -e "\n\nNo NVIDIA GPU found... installing CPU requirements."
    pip3 install --no-cache-dir --user -r .devcontainer/requirements-cpu.txt -e .
fi


echo "Done."
