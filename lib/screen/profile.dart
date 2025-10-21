import 'package:flutter/material.dart';
import 'package:level4/sheard/colors.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "mustafa mahfoud",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green, width: 3),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1542038784456-1ea8e935640e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  ),
                  radius: 40,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "1",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Posts",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          "8",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Followers",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          "12",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Following",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(12),
            width: double.infinity,
            child: Text("Flutter Developer", textAlign: TextAlign.start),
          ),
          SizedBox(height: 20),
          Divider(thickness: widthScreen > 600 ? 0.5 : 0.3, color: Colors.grey),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: primaryColor, size: 24.0),
                  label: Text(
                    "Edit profile",
                    style: TextStyle(fontSize: 15, color: primaryColor),
                  ),
                  style: ButtonStyle(
                    //backgroundColor: MaterialStateProperty.all(Color.fromARGB(146, 90, 104, 223)),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        vertical: widthScreen > 600 ? 20 : 10,
                        horizontal:20,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.output, color: primaryColor, size: 24.0),
                  label: Text(
                    "Log out     ",
                    style: TextStyle(fontSize: 15, color: primaryColor),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(146, 216, 39, 121),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical:widthScreen>600?20:10, horizontal: 20),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
                     ),
          SizedBox( height:widthScreen>600?30: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(),
              margin:widthScreen>600?EdgeInsets.symmetric(horizontal:  widthScreen/10): EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      "https://as2.ftcdn.net/v2/jpg/02/97/26/43/1000_F_297264348_bFuh1hC3rmHydE0BX2V8qxsA8LHj2ZpU.jpg",
                      fit: BoxFit.cover,

                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
