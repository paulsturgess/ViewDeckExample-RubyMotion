class NestViewController < UIViewController

  attr_accessor :level

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
      self.level = 0 if self
    end
  end

  # - (void)viewDidLoad
  # {
  #     [super viewDidLoad];
  #     self.levelLabel.text = [NSString stringWithFormat:@"Level %d", self.level];
  # }
  def viewDidLoad
    super
    view.backgroundColor = UIColor.whiteColor
    levelLabel.text = "Level #{self.level}"
    view.addSubview(levelLabel)
    view.addSubview(goDeeperButton)
  end

  def levelLabel
    return @levelLabel if @levelLabel
    @levelLabel = UILabel.alloc.initWithFrame(CGRectZero)
    @levelLabel.font = UIFont.systemFontOfSize(28)
    @levelLabel.text = "Label"
    @levelLabel.textColor = UIColor.blackColor
    @levelLabel.backgroundColor = UIColor.whiteColor
    @levelLabel.sizeToFit
    @levelLabel.frame = [
      [20, 20],
      [280, 27]
    ]
    @levelLabel
  end

  def goDeeperButton
    return @goDeeperButton if @goDeeperButton
    @goDeeperButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @goDeeperButton.setTitle("Go deeper", forState:UIControlStateNormal)
    @goDeeperButton.sizeToFit
    @goDeeperButton.frame = CGRect.new(
      [20, levelLabel.frame.origin.y + levelLabel.frame.size.height + 5],
      [173, 37]
    )
    @goDeeperButton.addTarget(
      self,
      action: "pressedGoDeeper",
      forControlEvents:UIControlEventTouchUpInside
    )
    @goDeeperButton
  end

  # - (void)hideOrShow {
  #     [[UIApplication sharedApplication] setStatusBarHidden:![UIApplication sharedApplication].isStatusBarHidden withAnimation:UIStatusBarAnimationSlide];
  # }
  def hideOrShow
    UIApplication.sharedApplication.setStatusBarHidden(
      !UIApplication.sharedApplication.isStatusBarHidden,
      withAnimation: UIStatusBarAnimationSlide
    )
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
  def pressedGoDeeper
    nestController = NestViewController.alloc.initWithNibName(nil, bundle: nil)
    nestController.level = level + 1
    navigationController.pushViewController(nestController, animated:true)
  end

end