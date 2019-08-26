class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),() => Navigator.pushNamed(context, "/login"));
  }