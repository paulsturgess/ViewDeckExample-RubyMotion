class RightViewController < UIViewController

  attr_accessor :logs

  # - (void)viewDidLoad {
  #     [super viewDidLoad];
  #     self.logs = [NSMutableArray array];
  #     self.viewDeckController.delegate = self;
  #     self.tableView.scrollsToTop = NO;
  #     self.pushButton.enabled = NO;
  #     self.pushButton.layer.opacity = 0.2;
  # }
  def viewDidLoad
    super
    background = UIImageView.alloc.initWithFrame(self.view.bounds)
    background.image = UIImage.imageNamed('bg.jpg')
    background.contentMode = UIViewContentModeScaleToFill
    background.userInteractionEnabled = false
    view.addSubview(background)

    viewDeckController.delegate = self

    view.addSubview(tableView)
    tableView.scrollsToTop = false

    view.addSubview(defaultCenterButton)
    view.addSubview(swapLeftAndCenterButton)
    view.addSubview(centerNavControllerButton)
    view.addSubview(pushButton)
    view.addSubview(switchToLeftButton)

    pushButton.enabled = false
    pushButton.layer.opacity = 0.2
  end

  def tableView
    return @tableView if @tableView

    frame = [
      [0, 200],
      [self.view.bounds.size.width, self.view.bounds.size.height - 200]
    ]

    @tableView = UITableView.alloc.initWithFrame(
      frame,
      style: UITableViewStylePlain
    )

    @tableView.dataSource = self
    @tableView
  end

  def logs
    @logs ||= []
  end

  def defaultCenterButton
    return @defaultCenterButton if @defaultCenterButton
    @defaultCenterButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @defaultCenterButton.setTitle("Default Center", forState:UIControlStateNormal)
    @defaultCenterButton.sizeToFit
    @defaultCenterButton.frame = CGRect.new(
      [127, 20],
      [173, 27]
    )
    @defaultCenterButton.addTarget(
      self,
      action: "defaultCenterPressed",
      forControlEvents:UIControlEventTouchUpInside
    )
    @defaultCenterButton
  end

  def swapLeftAndCenterButton
    return @swapLeftAndCenterButton if @swapLeftAndCenterButton
    @swapLeftAndCenterButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @swapLeftAndCenterButton.setTitle("Swap Left & Center", forState:UIControlStateNormal)
    @swapLeftAndCenterButton.sizeToFit
    @swapLeftAndCenterButton.frame = CGRect.new(
      [127, defaultCenterButton.frame.size.height + defaultCenterButton.frame.origin.y + 5],
      [173, 27]
    )
    @swapLeftAndCenterButton.addTarget(
      self,
      action: "swapLeftAndCenterPressed",
      forControlEvents:UIControlEventTouchUpInside
    )
    @swapLeftAndCenterButton
  end

  def centerNavControllerButton
    return @centerNavControllerButton if @centerNavControllerButton
    @centerNavControllerButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @centerNavControllerButton.setTitle("Center nav Controller", forState:UIControlStateNormal)
    @centerNavControllerButton.sizeToFit
    @centerNavControllerButton.frame = CGRect.new(
      [127, swapLeftAndCenterButton.frame.origin.y + swapLeftAndCenterButton.frame.size.height + 5],
      [173, 27]
    )
    @centerNavControllerButton.addTarget(
      self,
      action: "centerNavControllerPressed",
      forControlEvents:UIControlEventTouchUpInside
    )
    @centerNavControllerButton
  end

  def pushButton
    return @pushButton if @pushButton
    @pushButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @pushButton.setTitle("Push", forState:UIControlStateNormal)
    @pushButton.sizeToFit
    @pushButton.frame = CGRect.new(
      [127, centerNavControllerButton.frame.origin.y + centerNavControllerButton.frame.size.height + 5],
      [173, 27]
    )
    @pushButton.addTarget(
      self,
      action: "pushOverCenter",
      forControlEvents:UIControlEventTouchUpInside
    )
    @pushButton
  end

  def switchToLeftButton
    return @switchToLeftButton if @switchToLeftButton
    @switchToLeftButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @switchToLeftButton.setTitle("Switch To Left", forState:UIControlStateNormal)
    @switchToLeftButton.sizeToFit
    @switchToLeftButton.frame = CGRect.new(
      [127, pushButton.frame.origin.y + pushButton.frame.size.height + 5],
      [173, 27]
    )
    @switchToLeftButton.addTarget(
      self,
      action: "moveToLeft",
      forControlEvents:UIControlEventTouchUpInside
    )
    @switchToLeftButton
  end

  # - (void)viewWillAppear:(BOOL)animated {
  #     [super viewWillAppear:animated];
  #     [self addLog:@"view will appear"];
  # }
  def viewWillAppear(animated)
    super
    addLog "view will appear"
  end

  # - (void)viewWillDisappear:(BOOL)animated {
  #     [super viewWillDisappear:animated];
  #     [self addLog:@"view will disappear"];
  # }
  def viewWillDissappear(animated)
    super
    addLog "view will dissapear"
  end

  # - (void)viewDidAppear:(BOOL)animated {
  #     [super viewDidAppear:animated];
  #     [self addLog:@"view did appear"];
  # }
  def viewDidAppear(animated)
    super
    addLog "view did appear"
  end

  # - (void)viewDidDisappear:(BOOL)animated {
  #     [super viewDidDisappear:animated];
  #     [self addLog:@"view did disappear"];
  # }
  def viewDidDisappear(animated)
    super
    addLog "view did disappear"
  end

  # - (IBAction)defaultCenterPressed:(id)sender {
  #     self.viewDeckController.centerController = SharedAppDelegate.centerController;
  #     self.viewDeckController.leftController = SharedAppDelegate.leftController;
  #     self.pushButton.enabled = NO;
  #     self.pushButton.layer.opacity = 0.2;
  # }
  def defaultCenterPressed
    viewDeckController.centerController = UIApplication.sharedApplication.delegate.centerController
    viewDeckController.leftController = UIApplication.sharedApplication.delegate.leftController
    pushButton.enabled = false
    pushButton.layer.opacity = 0.2
  end

  # - (IBAction)swapLeftAndCenterPressed:(id)sender {
  #     self.viewDeckController.centerController = SharedAppDelegate.leftController;
  #     self.viewDeckController.leftController = SharedAppDelegate.centerController;
  #     self.pushButton.enabled = NO;
  #     self.pushButton.layer.opacity = 0.2;
  # }
  def swapLeftAndCenterPressed
    viewDeckController.centerController = UIApplication.sharedApplication.delegate.leftController
    viewDeckController.leftController = UIApplication.sharedApplication.delegate.centerController
    pushButton.enabled = false
    pushButton.layer.opacity = 0.2
  end

  # - (IBAction)centerNavController:(id)sender {
  #     self.viewDeckController.leftController = SharedAppDelegate.leftController;
  #     NestViewController* nestController = [[NestViewController alloc] initWithNibName:@"NestViewController" bundle:nil];
  #     UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:nestController];
  #     self.viewDeckController.centerController = navController;
  #     self.pushButton.enabled = YES;
  #     self.pushButton.layer.opacity = 1;
  # }
  def centerNavControllerPressed
    viewDeckController.leftController = UIApplication.sharedApplication.delegate.leftController
    nestController = NestViewController.alloc.initWithNibName(nil, bundle: nil)
    navController = UINavigationController.alloc.initWithRootViewController(nestController)
    viewDeckController.centerController = navController

    pushButton.enabled = true
    pushButton.layer.opacity = 1
  end

  # - (void)pushOverCenter:(id)sender {
  #     PushedViewController* controller = [[PushedViewController alloc] initWithNibName:@"PushedViewController" bundle:nil];
  #     [self.viewDeckController rightViewPushViewControllerOverCenterController:controller];
  # }
  def pushOverCenter
    controller = PushedViewController.alloc.initWithNibName(nil, bundle: nil)
    viewDeckController.rightViewPushViewControllerOverCenterController(controller)
  end

  # - (IBAction)moveToLeft:(id)sender {
  #     [self.viewDeckController toggleOpenView];
  # }
  def moveToLeft
    viewDeckController.toggleOpenView
  end

  # - (void)addLog:(NSString*)line {
  #     self.tableView.frame = (CGRect) { self.viewDeckController.rightSize, self.tableView.frame.origin.y,
  #         self.view.frame.size.width - self.viewDeckController.rightSize, self.tableView.frame.size.height };
  #     [self.logs addObject:line];
  #     NSIndexPath* index = [NSIndexPath indexPathForRow:self.logs.count-1 inSection:0];
  #     [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationBottom];
  #     [self.tableView scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionBottom animated:YES];
  # }
  def addLog(line)
    tableView.frame = CGRect.new(
      [viewDeckController.rightSize, tableView.frame.origin.y,],
      [(view.frame.size.width - viewDeckController.rightSize), tableView.frame.size.height]
    )

    logs << line
    index = NSIndexPath.indexPathForRow(logs.count-1, inSection:0)
    tableView.insertRowsAtIndexPaths([index], withRowAnimation: UITableViewRowAnimationBottom)
    tableView.scrollToRowAtIndexPath(index, atScrollPosition: UITableViewScrollPositionBottom, animated: true)
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController didChangeOffset:(CGFloat)offset orientation:(IIViewDeckOffsetOrientation)orientation panning:(BOOL)panning {
  #     [self addLog:[NSString stringWithFormat:@"%@: %f", panning ? @"Pan" : @"Offset", offset]];
  # }
  def viewDeckController(viewDeckController, didChangeOffset: offset, orientation: orientation, panning: panning)
    addLog([(panning ? "Pan" : "Offset"), offset].join(": "))
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController willOpenViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"will open %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, willOpenViewSide: viewDeckSide, animated: animated)
    addLog("will open #{NSStringFromIIViewDeckSide(viewDeckSide)} view")
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController didOpenViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"did open %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, didOpenViewSide: viewDeckSide, animated: animated)
    addLog("did open #{NSStringFromIIViewDeckSide(viewDeckSide)} view")
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController willCloseViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"will close %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, willCloseViewSide: viewDeckSide, animated: animated)
    addLog("will close #{NSStringFromIIViewDeckSide(viewDeckSide)} view")
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController didCloseViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"did close %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, didCloseViewSide:viewDeckSide, animated: animated)
    addLog("did close #{NSStringFromIIViewDeckSide(viewDeckSide)} view")
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController didShowCenterViewFromSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"did show center view from %@", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, didShowCenterViewFromSide: viewDeckSide, animated: animated)
    addLog("did show center view from #{NSStringFromIIViewDeckSide(viewDeckSide)}")
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController willPreviewBounceViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"will preview bounce %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, willPreviewBounceViewSide: viewDeckSide, animated: animated)
    addLog("will preview bounce #{NSStringFromIIViewDeckSide(viewDeckSide)} view")
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController didPreviewBounceViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"did preview bounce %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, didPreviewBounceViewSide: viewDeckSide, animated: animated)
    addLog("did preview bounce #{NSStringFromIIViewDeckSide(viewDeckSide)} view")
  end

  # - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
  # {
  #     return 1;
  # }
  def numberOfSectionsInTableView(tableView)
    1
  end

  # - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
  # {
  #     return self.logs.count;
  # }
  def tableView(tableView, numberOfRowsInSection: section)
    logs.size
  end

  # - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
  # {
  #     static NSString *CellIdentifier = @"Cell";
  #     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  #     if (cell == nil) {
  #         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  #     }
  #     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  #     cell.textLabel.font = [UIFont boldSystemFontOfSize:13];
  #     cell.textLabel.text = [self.logs objectAtIndex:indexPath.row];
  #     return cell;
  # }
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cellIdentifier = "Cell"
    cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
    cell ||= UITableViewCell.alloc.initWithStyle(
      UITableViewCellStyleDefault,
      reuseIdentifier: cellIdentifier
    )
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell.textLabel.font = UIFont.boldSystemFontOfSize(13)
    cell.textLabel.text = logs[indexPath.row]
    cell
  end

end