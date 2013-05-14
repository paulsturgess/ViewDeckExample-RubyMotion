class NestViewController < UIViewController

  attr_accessor :level, :levelLabel

  # - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
  # {
  #     self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  #     if (self) {
  #         self.level = 0;
  #     }
  #     return self;
  # }
  def initWithNibName(nibNameorNil, bundle:nibBundleorNil)
    super
    self.tap do
      self.try(:level=, 0)
    end
  end

  # - (void)viewDidLoad
  # {
  #     [super viewDidLoad];
  #     self.levelLabel.text = [NSString stringWithFormat:@"Level %d", self.level];
  # }
  def viewDidLoad
    super
    self.levelLabel.text = "Level #{self.level}"
  end

  # - (void)viewWillAppear:(BOOL)animated {
  #     [super viewWillAppear:animated];
  #     if (self.level == 1) {
  #         [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
  #         self.viewDeckController.view.frame = [[UIScreen mainScreen] applicationFrame];
  #         [self.viewDeckController.view setNeedsDisplay]; // .frame = self.viewDeckController.view.bounds;
  #     }
  # }
  def viewWillAppear(animated)
    super
    if self.level == 1
      UIApplication.sharedApplication.setStatusBarHidden(true, withAnimation: UIStatusBarAnimationNone)
      self.viewDeckController.view.frame = UIScreen.mainScreen.applicationFrame
      self.viewDeckController.view.setNeedsDisplay
    end
  end

  # - (void)viewDidDisappear:(BOOL)animated {
  #     [super viewDidDisappear:animated];
  #     if (self.level == 1) {
  #         [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
  #         self.viewDeckController.view.frame = [[UIScreen mainScreen] applicationFrame];
  #         [self.viewDeckController.view setNeedsDisplay]; // .frame = self.viewDeckController.view.bounds;
  #     }
  # }
  def viewDidDisappear(animated)
    super
    if self.level == 1
      UIApplication.sharedApplication.setStatusBarHidden(false, withAnimation: UIStatusBarAnimationNone)
      self.viewDeckController.view.frame = UIScreen.mainScreen.applicationFrame
      self.viewDeckController.view.setNeedsDisplay
    end
  end

  # - (void)hideOrShow {
  #     [[UIApplication sharedApplication] setStatusBarHidden:![UIApplication sharedApplication].isStatusBarHidden withAnimation:UIStatusBarAnimationSlide];
  # }
  def hideOrShow
    UIApplication.sharedApplication.setStatusBarHidden(!UIApplication.sharedApplication.isStatusBarHidden, withAnimation: UIStatusBarAnimationSlide)
  end

  # - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
  # {
  #     // Return YES for supported orientations
  #     return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  # }
  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    false
  end

  # - (IBAction)pressedGoDeeper:(id)sender {
  #     NestViewController* nestController = [[NestViewController alloc] initWithNibName:@"NestViewController" bundle:nil];
  #     nestController.level = self.level + 1;
  #     [self.navigationController pushViewController:nestController animated:YES];
  # }
  def pressedGoDeeper(sender)
    nestController = NestViewController.alloc.initWithNibName("NestViewController", bundle: nil)
    self.navigationController.pushViewController(nestController, animated:true)
  end

end