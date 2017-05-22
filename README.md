# Adfinis SyGroup AG Trainings

This are the source files for our trainings. For the builded versions, see:
https://docs.adfinis-sygroup.ch/public/trainings

## How to create a new training

- Copy the directory `skeleton` to your training name
 - All trainings need to be in the following directory structure:
  `training-name/module-name/`

- Edit `training-name/module-name/*yml` to your needs. This file is required to build the training.
- Add your training content
  - All images needs to be in a subdirectory of `training-name/module-name/`,
  eg.  `training-name/module-name/static`. Otherwise they will not display when builded
  - Make sure to only use non-copyrighted materials

- Add the files to the git repository and push it. After a few minutes, the new training should be available at https://docs.adfinis-sygroup.ch/public/trainings
