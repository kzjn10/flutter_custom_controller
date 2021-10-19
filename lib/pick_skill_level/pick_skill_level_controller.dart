part of 'pick_skill_level_widget.dart';

class PickSkillLevelController
    extends ValueNotifier<PickSkillLeverValue?> {
  PickSkillLevelController(PickSkillLeverValue? value) : super(value);

  PickSkillLeverValue? get data => value;

  void setSkillLevel(SkillLevelModel skillLevelData) {
    if (value == null) {
      value = PickSkillLeverValue(skillLevelData);
    } else {
      value?.skillLevelData = SkillLevelModel(
        value: skillLevelData.value,
        title: skillLevelData.title,
      );
    }
    notifyListeners();
  }
}
