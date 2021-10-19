part of 'pick_skill_level_widget.dart';

class SkillLevelWidget extends StatelessWidget {
  const SkillLevelWidget({
    Key? key,
    required this.data,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final SkillLevelModel data;
  final bool isSelected;
  final Function(SkillLevelModel)? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onPressed != null
              ? () {
                  onPressed!(data);
                }
              : null,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: isSelected ? theme.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: isSelected ? theme.primaryColor : theme.dividerColor),
            ),
            child: Text(
              data.title,
              style: theme.textTheme.subtitle2,
            ),
          ),
        ),
      ),
    );
  }
}
