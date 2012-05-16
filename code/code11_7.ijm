macro "flexible loop by for" {
  imagej_first_release = 1997;
  trial = 10;
  for (correct = 0; correct < 1; ) {
    answer = getNumber("In which year did the first version of ImageJ released?", 1900);
    if (answer == imagej_first_release ){
      showMessage("CORRECT! The year" + imagej_first_release);		
      correct++;
    } else {
      showMessage("NO. try again: trials left:" + trial);
      trial--;
    }
    if (trial < 1)
            correct++;
  }
}
