part of '../add_note_view.dart';

SizedBox _buildColorPaletteSizedBox(BuildContext context, AddNoteCubit read) {
  return SizedBox(
    height: context.colorPaletteHeight,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        BackgroundNoteCardColors.instance.getColorList.length,
        (index) => InkWell(
          onTap: () => read.changeSelectedColor(index),
          child: _buildColorPaletteItemContainer(index, context),
        ),
      ),
    ),
  );
}

Container _buildColorPaletteItemContainer(int index, BuildContext context) {
  return Container(
    height: SizeConstant.instance.colorPaletteSize,
    width: SizeConstant.instance.colorPaletteSize,
    decoration: BoxDecoration(
      color: BackgroundNoteCardColors.instance.getColorList[index],
      border: Border.all(color: Colors.grey),
      borderRadius: context.border25Radius,
    ),
  );
}
