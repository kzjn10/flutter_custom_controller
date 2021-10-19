import 'package:flutter/material.dart';

import 'skill_level_constants.dart';

part 'pick_skill_level_controller.dart';

part 'pick_skill_level_value.dart';

part 'skill_level_item_widget.dart';

class PickSkillLevelWidget extends StatefulWidget {
  const PickSkillLevelWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PickSkillLevelController controller;

  @override
  State<PickSkillLevelWidget> createState() => _PickSkillLevelWidgetState();
}

class _PickSkillLevelWidgetState extends State<PickSkillLevelWidget> {
  late final List<SkillLevelModel> dataSet;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    dataSet = <SkillLevelModel>[
      SkillLevelModel(
        value: SkillLevelConstants.easy,
        title: 'Easy',
      ),
      SkillLevelModel(
        value: SkillLevelConstants.medium,
        title:'Medium',
      ),
      SkillLevelModel(
        value: SkillLevelConstants.hard,
        title: 'Hard',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.data == null) {
      widget.controller.setSkillLevel(dataSet.first);
    }

    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (BuildContext context, PickSkillLeverValue? controller, _) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select skill level'),
              const SizedBox(height: 10),
              Center(
                child: Wrap(
                  children: dataSet
                      .map(
                        (e) => SkillLevelWidget(
                          data: e,
                          isSelected: controller?.data.value == e.value,
                          onPressed: (SkillLevelModel data) {
                            widget.controller.setSkillLevel(data);
                          },
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
