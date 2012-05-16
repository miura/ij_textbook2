macro "flexible loop by while" {
  answer_is_wrong = true;
  imagej_first_release = 1997;
  trial = 5;
  while (answer_is_wrong) {
    answer = getNumber("In which year did the first version of ImageJ released?", 1900);
    if (answer == imagej_first_release )}
      answer_is_wrong = false;
            showMessage("CORRECT! The year" + imagej_first_release);		
        } else {
            showMessage("NO. try again: trials left:" + trial);
            trial--;
        }
        if (trial < 1)
            answer_is_wrong = false;
  }
}
