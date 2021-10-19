part of 'pick_skill_level_widget.dart';

class PickSkillLeverValue {
  SkillLevelModel data;

  PickSkillLeverValue(this.data);

  SkillLevelModel get skillLevelData => data;

  set skillLevelData(SkillLevelModel data) {
    this.data = SkillLevelModel(value: data.value, title: data.title);
  }
}

class SkillLevelModel {
  final int value;
  final String title;

  SkillLevelModel({required this.value, required this.title});
}
