import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Dietplan extends StatefulWidget {
  Dietplan({required this.bmiCategory});
  final String bmiCategory;
  @override
  State<Dietplan> createState() => _DietplanState();
}

const cardText = TextStyle(

  fontWeight: FontWeight.bold,
);

class _DietplanState extends State<Dietplan> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Diet Plan'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Color(0xfff1f3f5),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                    ),
                  ]),
              child: TabBar(
                dividerHeight: 0,
                splashBorderRadius: BorderRadius.circular(40.0),
                indicator: CustomTabIndicator(
                  width: 130,
                  height: 50,
                  color: Colors.orange,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Breakfast',
                  ),
                  Tab(
                    text: 'Lunch',
                  ),
                  Tab(
                    text: 'Dinner',
                  ),
                ],
                indicatorPadding: EdgeInsets.zero,
                indicatorColor: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  //Breakfast
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        if(widget.bmiCategory=="Underweight")...[
                          DietCard(imagePath: 'assets/UnderweightBreakfast/Peanut Butter Banana Toast.jpg', foodName: 'Peanut Butter Banana Toast', caloriesAmount: '300', weight: '100G', proteinAmount: 7, carbAmount: 35, fatAmount: 12),
                          DietCard(imagePath: 'assets/UnderweightBreakfast/Paneer Paratha.jpg', foodName: 'Paneer Paratha', caloriesAmount: '350', weight: '150G', proteinAmount: 12, carbAmount: 40, fatAmount: 20),
                          DietCard(imagePath: 'assets/UnderweightBreakfast/Scrambled Eggs.jpg', foodName: 'Scrambled Eggs with Wheat Bread', caloriesAmount: '320', weight: '150G', proteinAmount: 15, carbAmount: 30, fatAmount: 14),
                          DietCard(imagePath: 'assets/UnderweightBreakfast/Oats with Dry Fruits.jpg', foodName: 'Oats with Dry Fruits', caloriesAmount: '280', weight: '150G', proteinAmount: 10, carbAmount: 40, fatAmount: 8),
                          DietCard(imagePath: 'assets/UnderweightBreakfast/Cheese Sandwich.jpg', foodName: 'Cheese Sandwich with Butter', caloriesAmount: '330', weight: '150G', proteinAmount: 12, carbAmount: 35, fatAmount: 16),
                          DietCard(imagePath: 'assets/UnderweightBreakfast/Besan Chilla.jpg', foodName: 'Besan Chilla with Green Chutney', caloriesAmount: '300', weight: '150G', proteinAmount: 10, carbAmount: 30, fatAmount: 12),
                          DietCard(imagePath: 'assets/UnderweightBreakfast/Banana Almond Milkshake.jpg', foodName: 'Milkshake with Banana and Almonds', caloriesAmount: '350', weight: '200G', proteinAmount: 10, carbAmount: 45, fatAmount: 12),
                        ]
                        else if(widget.bmiCategory=="Normal")...[
                          DietCard(imagePath: 'assets/HealthyBreakfast/Oats with Dry Fruits.jpg', foodName: 'Oats with Milk and Fruits', caloriesAmount: '250', weight: '150G', proteinAmount: 10, carbAmount: 40, fatAmount: 5),
                          DietCard(imagePath: 'assets/HealthyBreakfast/Vegetable Poha.jpg', foodName: 'Vegetable Poha', caloriesAmount: '200', weight: '150G', proteinAmount: 6, carbAmount: 35, fatAmount: 4),
                          DietCard(imagePath: 'assets/HealthyBreakfast/Boiled Eggs Toast.jpg', foodName: 'Boiled Eggs with Wheat Toast', caloriesAmount: '220', weight: '100G', proteinAmount: 12, carbAmount: 20, fatAmount: 8),
                          DietCard(imagePath: 'assets/HealthyBreakfast/Greek Yogurt Berries.jpg', foodName: 'Greek Yogurt with Berries', caloriesAmount: '150', weight: '150G', proteinAmount: 10, carbAmount: 15, fatAmount: 5),
                          DietCard(imagePath: 'assets/HealthyBreakfast/Upma.jpg', foodName: 'Upma with Coconut Chutney', caloriesAmount: '250', weight: '150G', proteinAmount: 8, carbAmount: 35, fatAmount: 6),
                          DietCard(imagePath: 'assets/HealthyBreakfast/Smoothie Bowl.jpg', foodName: 'Smoothie Bowl with Nuts and Seeds', caloriesAmount: '280', weight: '200G', proteinAmount: 10, carbAmount: 40, fatAmount: 8),
                          DietCard(imagePath: 'assets/HealthyBreakfast/Besan Chilla.jpg', foodName: 'Besan Chilla with Mint Chutney', caloriesAmount: '200', weight: '150G', proteinAmount: 10, carbAmount: 25, fatAmount: 6),
                        ]else if(widget.bmiCategory == 'Overweight' || widget.bmiCategory == 'Obesity' || widget.bmiCategory == 'Very Severe Obesity')...[
                          DietCard(imagePath: 'assets/OverweightBreakfast/Boiled Eggs Avocado.jpg', foodName: 'Boiled Eggs with Avocado', caloriesAmount: '200', weight: '100G', proteinAmount: 12, carbAmount: 8, fatAmount: 5),
                          DietCard(imagePath: 'assets/OverweightBreakfast/Greek Yogurt Berries.jpg', foodName: 'Greek Yogurt with Berries', caloriesAmount: '150', weight: '150G', proteinAmount: 10, carbAmount: 15, fatAmount: 5),
                          DietCard(imagePath: 'assets/OverweightBreakfast/Vegetable Smoothie.jpg', foodName: 'Vegetable Smoothie', caloriesAmount: '120', weight: '200G', proteinAmount: 5, carbAmount: 20, fatAmount: 3),
                          DietCard(imagePath: 'assets/OverweightBreakfast/Oats Porridge.jpg', foodName: 'Oats Porridge with Almonds', caloriesAmount: '180', weight: '150G', proteinAmount: 8, carbAmount: 25, fatAmount: 5),
                          DietCard(imagePath: 'assets/OverweightBreakfast/Moong Dal Chilla.jpg', foodName: 'Moong Dal Chilla', caloriesAmount: '150', weight: '100G', proteinAmount: 10, carbAmount: 15, fatAmount: 4),
                          DietCard(imagePath: 'assets/OverweightBreakfast/Fruit Salad.jpg', foodName: 'Fruit Salad with Chia Seeds', caloriesAmount: '130', weight: '150G', proteinAmount: 4, carbAmount: 25, fatAmount: 3),
                          DietCard(imagePath: 'assets/OverweightBreakfast/Egg Whites Spinach.jpg', foodName: 'Scrambled Egg Whites with Spinach', caloriesAmount: '100', weight: '150G', proteinAmount: 12, carbAmount: 5, fatAmount: 3),
                        ],
                      ],
                    ),
                  ),

                  //TODO Lunch
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        if(widget.bmiCategory=="Underweight")...[
                          DietCard(imagePath: 'assets/UnderweightLunch/Chicken Biryani.jpg', foodName: 'Chicken Biryani', caloriesAmount: '500', weight: '200G', proteinAmount: 20, carbAmount: 60, fatAmount: 18),
                          DietCard(imagePath: 'assets/UnderweightLunch/Rajma Chawal.jpg', foodName: 'Rajma Chawal', caloriesAmount: '400', weight: '200G', proteinAmount: 18, carbAmount: 45, fatAmount: 14),
                          DietCard(imagePath: 'assets/UnderweightLunch/Egg Curry.jpg', foodName: 'Egg Curry with Rice', caloriesAmount: '400', weight: '200G', proteinAmount: 18, carbAmount: 45, fatAmount: 14),
                          DietCard(imagePath: 'assets/UnderweightLunch/Mutton Curry.jpg', foodName: 'Mutton Curry with Naan', caloriesAmount: '550', weight: '200G', proteinAmount: 25, carbAmount: 50, fatAmount: 20),
                          DietCard(imagePath: 'assets/UnderweightLunch/Paneer Butter Masala.jpg', foodName: 'Paneer Butter Masala with Roti', caloriesAmount: '480', weight: '200G', proteinAmount: 15, carbAmount: 40, fatAmount: 18),
                          DietCard(imagePath: 'assets/UnderweightLunch/Fish Curry.jpg', foodName: 'Fish Curry', caloriesAmount: '400', weight: '200G', proteinAmount: 20, carbAmount: 45, fatAmount: 12),
                          DietCard(imagePath: 'assets/UnderweightLunch/Dal Makhani.jpg', foodName: 'Dal Makhani with Naan', caloriesAmount: '450', weight: '200G', proteinAmount: 12, carbAmount: 50, fatAmount: 16),
                        ]
                        else if(widget.bmiCategory=="Normal")...[
                          DietCard(imagePath: 'assets/HealthyLunch/Grilled Chicken Quinoa.jpg', foodName: 'Grilled Chicken with Quinoa', caloriesAmount: '350', weight: '200G', proteinAmount: 25, carbAmount: 30, fatAmount: 10),
                          DietCard(imagePath: 'assets/HealthyLunch/Fish Curry.jpg', foodName: 'Fish Curry with Brown Rice', caloriesAmount: '400', weight: '200G', proteinAmount: 20, carbAmount: 45, fatAmount: 12),
                          DietCard(imagePath: 'assets/HealthyLunch/Vegetable Khichdi.jpg', foodName: 'Vegetable Khichdi with Curd', caloriesAmount: '300', weight: '200G', proteinAmount: 8, carbAmount: 50, fatAmount: 6),
                          DietCard(imagePath: 'assets/HealthyLunch/Paneer Tikka.jpg', foodName: 'Paneer Tikka with Salad', caloriesAmount: '320', weight: '200G', proteinAmount: 15, carbAmount: 20, fatAmount: 12),
                          DietCard(imagePath: 'assets/HealthyLunch/Lentil Soup.jpg', foodName: 'Lentil Soup with Wheat Bread', caloriesAmount: '250', weight: '200G', proteinAmount: 12, carbAmount: 20, fatAmount: 6),
                          DietCard(imagePath: 'assets/HealthyLunch/Chicken Salad.jpg', foodName: 'Chicken Salad with Oil Dressing', caloriesAmount: '280', weight: '200G', proteinAmount: 20, carbAmount: 15, fatAmount: 10),
                          DietCard(imagePath: 'assets/HealthyLunch/Rajma Rice.jpg', foodName: 'Rajma with Brown Rice', caloriesAmount: '350', weight: '200G', proteinAmount: 12, carbAmount: 45, fatAmount: 8),
                        ]else if(widget.bmiCategory == 'Overweight' || widget.bmiCategory == 'Obesity' || widget.bmiCategory == 'Very Severe Obesity')...[
                          DietCard(imagePath: 'assets/OverweightLunch/Grilled Fish Vegetables.jpg', foodName: 'Grilled Fish with Steamed Vegetables', caloriesAmount: '300', weight: '200G', proteinAmount: 25, carbAmount: 20, fatAmount: 10),
                          DietCard(imagePath: 'assets/OverweightLunch/Lentil Soup Salad.jpg', foodName: 'Lentil Soup Salad', caloriesAmount: '250', weight: '200G', proteinAmount: 12, carbAmount: 30, fatAmount: 6),
                          DietCard(imagePath: 'assets/OverweightLunch/Grilled Chicken Quinoa.jpg', foodName: 'Grilled Chicken with Quinoa', caloriesAmount: '350', weight: '200G', proteinAmount: 25, carbAmount: 30, fatAmount: 10),
                          DietCard(imagePath: 'assets/OverweightLunch/Vegetable Stir-Fry.jpg', foodName: 'Vegetable Stir-Fry', caloriesAmount: '280', weight: '200G', proteinAmount: 12, carbAmount: 25, fatAmount: 10),
                          DietCard(imagePath: 'assets/OverweightLunch/Chicken Salad.jpg', foodName: 'Chicken Salad', caloriesAmount: '250', weight: '200G', proteinAmount: 20, carbAmount: 15, fatAmount: 10),
                          DietCard(imagePath: 'assets/OverweightLunch/Grilled Tofu Broccoli.jpg', foodName: 'Grilled Tofu with Broccoli', caloriesAmount: '200', weight: '150G', proteinAmount: 15, carbAmount: 10, fatAmount: 8),
                          DietCard(imagePath: 'assets/OverweightLunch/Egg Curry.jpg', foodName: 'Egg Curry with Roti', caloriesAmount: '320', weight: '200G', proteinAmount: 15, carbAmount: 30, fatAmount: 12),
                        ],
                      ],
                    ),
                  ),


                  //TODO Dinner
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        if(widget.bmiCategory=="Underweight")...[
                          DietCard(imagePath: 'assets/UnderweightDinner/Grilled Chicken.jpg', foodName: 'Grilled Chicken', caloriesAmount: '400', weight: '200G', proteinAmount: 25, carbAmount: 35, fatAmount: 15),
                          DietCard(imagePath: 'assets/UnderweightDinner/Vegetable Pulao.jpg', foodName: 'Vegetable Pulao', caloriesAmount: '350', weight: '200G', proteinAmount: 10, carbAmount: 50, fatAmount: 10),
                          DietCard(imagePath: 'assets/UnderweightDinner/Chicken Soup.jpg', foodName: 'Chicken Soup with Wheat Bread', caloriesAmount: '250', weight: '200G', proteinAmount: 15, carbAmount: 30, fatAmount: 8),
                          DietCard(imagePath: 'assets/UnderweightDinner/Egg Fried Rice.jpg', foodName: 'Egg Fried Rice', caloriesAmount: '380', weight: '200G', proteinAmount: 12, carbAmount: 45, fatAmount: 14),
                          DietCard(imagePath: 'assets/UnderweightDinner/Paneer Bhurji.jpg', foodName: 'Paneer Bhurji with Roti', caloriesAmount: '320', weight: '200G', proteinAmount: 15, carbAmount: 30, fatAmount: 12),
                          DietCard(imagePath: 'assets/UnderweightDinner/Chicken Tikka.jpg', foodName: 'Chicken Tikka with Salad', caloriesAmount: '300', weight: '200G', proteinAmount: 20, carbAmount: 20, fatAmount: 12),
                          DietCard(imagePath: 'assets/UnderweightDinner/Vegetable Khichdi.jpg', foodName: 'Vegetable Khichdi', caloriesAmount: '300', weight: '200G', proteinAmount: 8, carbAmount: 50, fatAmount: 6),
                        ]
                        else if(widget.bmiCategory=="Normal")...[
                          DietCard(imagePath: 'assets/HealthyDinner/Grilled Fish Vegetables.jpg', foodName: 'Grilled Fish Vegetables', caloriesAmount: '300', weight: '200G', proteinAmount: 25, carbAmount: 30, fatAmount: 10),
                          DietCard(imagePath: 'assets/HealthyDinner/Chicken Soup.jpg', foodName: 'Chicken Soup with Wheat Bread', caloriesAmount: '250', weight: '200G', proteinAmount: 15, carbAmount: 30, fatAmount: 8),
                          DietCard(imagePath: 'assets/HealthyDinner/Vegetable Stir-Fry.jpg', foodName: 'Vegetable Stir-Fry', caloriesAmount: '280', weight: '200G', proteinAmount: 12, carbAmount: 25, fatAmount: 8),
                          DietCard(imagePath: 'assets/HealthyDinner/Egg Curry.jpg', foodName: 'Egg Curry with Roti', caloriesAmount: '320', weight: '200G', proteinAmount: 15, carbAmount: 30, fatAmount: 12),
                          DietCard(imagePath: 'assets/HealthyDinner/Dal Rice.jpg', foodName: 'Dal Rice', caloriesAmount: '300', weight: '200G', proteinAmount: 10, carbAmount: 40, fatAmount: 6),
                          DietCard(imagePath: 'assets/HealthyDinner/Grilled Tofu Broccoli.jpg', foodName: 'Grilled Tofu Broccoli', caloriesAmount: '280', weight: '150G', proteinAmount: 15, carbAmount: 10, fatAmount: 8),
                          DietCard(imagePath: 'assets/HealthyDinner/Chicken Salad.jpg', foodName: 'Chicken Salad', caloriesAmount: '250', weight: '200G', proteinAmount: 20, carbAmount: 15, fatAmount: 10),
                        ]else if(widget.bmiCategory == 'Overweight' || widget.bmiCategory == 'Obesity' || widget.bmiCategory == 'Very Severe Obesity')...[
                          DietCard(imagePath: 'assets/OverweightDinner/Grilled Fish Vegetables.jpg', foodName: 'Grilled Fish Vegetables', caloriesAmount: '300', weight: '200G', proteinAmount: 25, carbAmount: 20, fatAmount: 10),
                          DietCard(imagePath: 'assets/OverweightDinner/Chicken Soup.jpg', foodName: 'Chicken Soup with Wheat Bread', caloriesAmount: '250', weight: '200G', proteinAmount: 15, carbAmount: 30, fatAmount: 8),
                          DietCard(imagePath: 'assets/OverweightDinner/Vegetable Stir-Fry.jpg', foodName: 'Vegetable Stir-Fry', caloriesAmount: '280', weight: '200G', proteinAmount: 12, carbAmount: 25, fatAmount: 8),
                          DietCard(imagePath: 'assets/OverweightDinner/Egg Curry.jpg', foodName: 'Egg Curry with Roti', caloriesAmount: '320', weight: '200G', proteinAmount: 15, carbAmount: 30, fatAmount: 12),
                          DietCard(imagePath: 'assets/OverweightDinner/Dal Rice.jpg', foodName: 'Dal with Streamed Rice', caloriesAmount: '300', weight: '200G', proteinAmount: 10, carbAmount: 40, fatAmount: 6),
                          DietCard(imagePath: 'assets/OverweightDinner/Grilled Tofu Broccoli.jpg', foodName: 'Grilled Tofu Broccoli', caloriesAmount: '200', weight: '150G', proteinAmount: 15, carbAmount: 10, fatAmount: 8),
                          DietCard(imagePath: 'assets/OverweightDinner/Chicken Salad.jpg', foodName: 'Chicken Salad', caloriesAmount: '200', weight: '200G', proteinAmount: 20, carbAmount: 15, fatAmount: 10),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  final double width;
  final double height;
  final Color color;

  CustomTabIndicator(
      {required this.width, required this.height, required this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(width: width, height: height, color: color);
  }
}

class _CustomPainter extends BoxPainter {
  final double width;
  final double height;
  final Color color;

  _CustomPainter(
      {required this.width, required this.height, required this.color});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = Rect.fromLTWH(
      offset.dx +
          (configuration.size!.width - width) / 2, // Centered horizontally
      offset.dy +
          configuration.size!.height -
          height, // Positioned at the bottom
      width, // Custom width
      height, // Custom height
    );
    final Paint paint = Paint()..color = color;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(25)), paint);
  }
}

//TODO: Diet Card

class DietCard extends StatelessWidget {
  DietCard({
    required this.imagePath,
    required this.foodName,
    required this.caloriesAmount,
    required this.weight,
    required this.proteinAmount,
    required this.carbAmount,
    required this.fatAmount,
  });
  final String imagePath;
  final String foodName;
  final String caloriesAmount;
  final String weight;
  final double proteinAmount;
  final double carbAmount;
  final double fatAmount;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1, // Shadow ka phailav
                  blurRadius: 1, // Shadow ka blur
                  // offset: Offset(4, 4),
                ),
              ]),
          child: Column(
            children: [
              //ROW NO.1
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 90,
                    width: 90,
                    child: ClipOval(
                      child: Image.asset(
                        this.imagePath,
                        fit: BoxFit.cover, // Image ko sahi se fit karne ke liye
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        this.foodName,
                        style: cardText,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('🔥$caloriesAmount kcal • $weight'),
                    ],
                  ),
                ],
              ),
              //TODO: Protein Indicator
               Row(
                  children: [
                    percentIndicator(
                        value: (proteinAmount/100)+0.1, color: Colors.greenAccent.shade400),
                    NutritionInfo(
                        nutritrionAmount: '${proteinAmount.toInt()} g',
                        nutritionType: 'Protein'),
                    //TODO: Carb Indicator
                    percentIndicator(value: (carbAmount/100)+0.1, color: Colors.orangeAccent),
                    NutritionInfo(
                        nutritrionAmount: '${carbAmount.toInt()} g', nutritionType: 'Carbs'),
                    //TODO: FAt Indicator
                    percentIndicator(value: (fatAmount/100)+0.1, color: Colors.deepPurpleAccent),
                    NutritionInfo(
                        nutritrionAmount: '${fatAmount.toInt()} g', nutritionType: 'Fat'),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}

//TODO: Diet Card
class percentIndicator extends StatelessWidget {
  percentIndicator({required this.value, required this.color});
  final double value;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 60, right: 3, top: 30),
      height: 55, // Set the height of the vertical progress bar
      width: 10, // Set the width of the vertical progress bar
      child: RotatedBox(
        quarterTurns: -1, // Rotates the progress bar to vertical
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16), // Rounded corners
          child: LinearProgressIndicator(
            value: this.value, // Progress value (0 to 1)
            backgroundColor: Colors.grey[300],
            color: this.color,
            minHeight: 8, // Thickness of the indicator
          ),
        ),
      ),
    );
  }
}

class NutritionInfo extends StatelessWidget {
  NutritionInfo({required this.nutritrionAmount, required this.nutritionType});
  final String nutritrionAmount;
  final String nutritionType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 28),
          child: Column(
            children: [
              Text(
                ' $nutritrionAmount',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('  $nutritionType',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
