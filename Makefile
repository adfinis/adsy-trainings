TRAINING_BUILDER=adsy-trainings-common.src/training-builder.py

all:
	$(TRAINING_BUILDER) --root=. --commons=adsy-trainings-common.src --build-dir=build

index:
	$(TRAINING_BUILDER) --root=. --commons=adsy-trainings-common.src --build-dir=build --index-only
