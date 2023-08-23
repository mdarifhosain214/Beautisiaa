import 'package:flutter/material.dart';
import '../app_colors.dart';
import 'big_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText=true;
  double textHeight = 150;//Dimensions.screenHeight/5.63;

  @override
  void initState() {
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?BigText(color:Colors.grey.shade500,size:16,text: firstHalf):Column(
        children: [
          BigText(color:Colors.grey.shade500,size:16,text: hiddenText?("$firstHalf..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState((){
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                BigText(text:hiddenText? "Show more":"show less",color: AppColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
