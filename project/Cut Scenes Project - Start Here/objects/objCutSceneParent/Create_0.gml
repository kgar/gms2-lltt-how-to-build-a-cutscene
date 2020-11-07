currentStep = 0;
counter = 0;

enum CutSceneStates {
	Active,
	Paused
}

currentState = CutSceneStates.Active;

playerCanMove = false;