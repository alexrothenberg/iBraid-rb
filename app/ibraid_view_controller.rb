class IBraidViewController < UIViewController
  def loadView
    self.view = IBraidView.alloc.init
  end
  
  # // Override to allow orientations other than the default portrait orientation.
  # - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  #     // Return YES for supported orientations
  #     return (interfaceOrientation == UIInterfaceOrientationPortrait);
  # }
end
