class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    @window.rootViewController = IBraidViewController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
  	@window.makeKeyAndVisible

    true
  end
end
