# Adfinis SyGroup AG Trainings

This are the source files for our trainings. For the builded versions, see:
https://docs.adfinis-sygroup.ch/public/trainings


## How to clone the git repository

For read-write clone it over ssh

    git clone --recursive git@github.com:adfinis-sygroup/adsy-trainings.git

or for read-only over https

    git clone --recursive https://github.com/adfinis-sygroup/adsy-trainings.git


## How to create a new training

Each training has three unique parts

- Name of the training
- Name of the module
- A unique ID

    $ ./adsy-trainings-common.src/new-training.sh <training name> <module name> <id>

- Edit `<training-name>/<id>_<module-name>/modul_<module-name>_<id>.yml` to
  your needs. This file is required to build the training.

- Add your training content

    - All images need to be in a subdirectory of
      `<training-name>/<id>_<module-name>/`,
      e.g. `<training-name>/<id>_<module-name>/`, otherwise they will not be
      displayed when built

    - Make sure to only use non-copyrighted materials

- Check if your training looks like you wish.

    cd <training-name>/<id>_<module-name>/
    make

- Add the files to the git repository and push it. After a few minutes, the
  new training should be available at
  https://docs.adfinis-sygroup.ch/public/trainings
