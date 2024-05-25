import 'package:fanclub/screen/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.035),
        child: Obx(
          () => controller.loader.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: height * 0.2,
                      width: width,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.network(
                              controller.favouritePlayers.value.first
                                      .playerImage ??
                                  "",
                              fit: BoxFit.fill,
                              width: width),
                          Container(
                            height: height * 0.085,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFC84E89),
                                      Color(0xFFF15F79),
                                    ],
                                    begin: FractionalOffset(0.0, 0.0),
                                    end: FractionalOffset(1.0, 0.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: width * 0.02),
                                Text("1",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                SizedBox(width: width * 0.03),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: width * 0.77,
                                      child: Text(
                                        controller.favouritePlayers.value.first
                                                .playerName ??
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.77,
                                      child: Text(
                                        (controller.favouritePlayers.value.first
                                                    .totalLike ??
                                                0)
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(Icons.favorite, color: Colors.white),
                                SizedBox(width: width * 0.02),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      "Favourite Players",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(height: height * 0.02),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        controller: controller.screollController,
                        itemCount: controller.favouritePlayers.value.length - 1,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                        itemBuilder: (context, index) {
                          final data =
                              controller.favouritePlayers.value[index + 1];
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.01),
                            child: Row(
                              children: [
                                Container(
                                  width: height*0.07,
                                  height: height*0.07,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(data.playerImage ?? ""),
                                      fit: BoxFit.fill
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      )),
    );
  }
}
