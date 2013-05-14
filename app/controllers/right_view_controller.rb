class RightViewController < UIViewController

  attr_accessor :logs, :tableView, :pushButton

  # def tableView
  #   return @tableView if @tableView
  #   @tableView = UITableView.alloc.initWithFrame(
  #     [
  #       [0, self.view.bounds.size.height],
  #       [self.view.bounds.size.width, self.view.bounds.size.height]
  #     ],
  #     style: UITableViewStylePlain
  #   )
  #   # @tableView.dataSource = self
  #   # @tableView.delegate = self
  #   @tableView
  # end

  def pushButton
    @pushButton ||= UIButton.alloc.init
  end

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
    self.view.backgroundColor = UIColor.lightGrayColor
    self.logs = ["Hello World"]
    self.viewDeckController.delegate = self

    self.tableView = UITableView.alloc.initWithFrame(self.view.bounds, style: UITableViewStylePlain)
        #   [
        #     [0, self.view.bounds.size.height],
        #     [self.view.bounds.size.width, self.view.bounds.size.height]
        #   ],
        #   style: UITableViewStylePlain
        # )

    self.view.addSubview(self.tableView)
    self.tableView.dataSource = self
    #self.tableView.delegate = self

    self.tableView.scrollsToTop = false

    self.pushButton.enabled = false
    self.pushButton.layer.opacity = 0.2
  end

  # - (void)viewWillAppear:(BOOL)animated {
  #     [super viewWillAppear:animated];
  #     [self addLog:@"view will appear"];
  # }
  def viewWillAppear(animated)
    super
    self.addLog "view will appear"
  end

  # - (void)viewWillDisappear:(BOOL)animated {
  #     [super viewWillDisappear:animated];
  #     [self addLog:@"view will disappear"];
  # }
  def viewWillDissappear(animated)
    super
    self.addLog "view will dissapear"
  end

  # - (void)viewDidAppear:(BOOL)animated {
  #     [super viewDidAppear:animated];
  #     [self addLog:@"view did appear"];
  # }
  def viewDidAppear(animated)
    super
    self.addLog "view did appear"
  end

  # - (void)viewDidDisappear:(BOOL)animated {
  #     [super viewDidDisappear:animated];
  #     [self addLog:@"view did disappear"];
  # }
  def viewDidDisappear(animated)
    super
    self.addLog "view did disappear"
  end

  # - (IBAction)defaultCenterPressed:(id)sender {
  #     self.viewDeckController.centerController = SharedAppDelegate.centerController;
  #     self.viewDeckController.leftController = SharedAppDelegate.leftController;
  #     self.pushButton.enabled = NO;
  #     self.pushButton.layer.opacity = 0.2;
  # }
  def defaultCenterPressed(sender)
    self.viewDeckController.centerController = SharedAppDelegate.centerController
    self.viewDeckController.leftController = SharedAppDelegate.leftController
    self.pushButton.enabled = false
    self.pushButton.layer.opacity = 0.2
  end

  # - (IBAction)swapLeftAndCenterPressed:(id)sender {
  #     self.viewDeckController.centerController = SharedAppDelegate.leftController;
  #     self.viewDeckController.leftController = SharedAppDelegate.centerController;
  #     self.pushButton.enabled = NO;
  #     self.pushButton.layer.opacity = 0.2;
  # }
  def swapLeftAndCenterPressed(sender)
    self.viewDeckController.centerController = SharedAppDelegate.leftController
    self.viewDeckController.leftController = SharedAppDelegate.centerController
    self.pushButton.enabled = false
    self.pushButton.layer.opacity = 0.2
  end

  # - (IBAction)centerNavController:(id)sender {
  #     self.viewDeckController.leftController = SharedAppDelegate.leftController;
  #     NestViewController* nestController = [[NestViewController alloc] initWithNibName:@"NestViewController" bundle:nil];
  #     UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:nestController];
  #     self.viewDeckController.centerController = navController;
  #     self.pushButton.enabled = YES;
  #     self.pushButton.layer.opacity = 1;
  # }
  def centerNavController(sender)
    self.viewDeckController.leftController = SharedAppDelegate.leftController
    nestController = NestViewController.alloc.initWithNibName("NestViewController", bundle: nil)
    navController = UINavigationController.alloc.initWithRootViewController(nestController)
    self.viewDeckController.centerController = navController

    self.pushButton.enabled = true
    self.pushButton.layer.opacity = 1
  end

  # - (void)pushOverCenter:(id)sender {
  #     PushedViewController* controller = [[PushedViewController alloc] initWithNibName:@"PushedViewController" bundle:nil];
  #     [self.viewDeckController rightViewPushViewControllerOverCenterController:controller];
  # }
  def pushOverCenter(sender)
    controller = PushedViewController.alloc.initWithNibName("PushedViewController", bundle: nil)
    self.viewDeckController.rightViewPushViewControllerOverCenterController(controller)
  end

  # - (IBAction)moveToLeft:(id)sender {
  #     [self.viewDeckController toggleOpenView];
  # }
  def moveToLeft(sender)
    self.viewDeckController.toggleOpenView
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
    self.tableView.frame = CGRect.new(
      [self.viewDeckController.rightSize, self.tableView.frame.origin.y,],
      [(self.view.frame.size.width - self.viewDeckController.rightSize), self.tableView.frame.size.height]
    )

    self.logs << line
    index = NSIndexPath.indexPathForRow(self.logs.count-1, inSection:0)
    self.tableView.insertRowsAtIndexPaths([index], withRowAnimation: UITableViewRowAnimationBottom)
    self.tableView.scrollToRowAtIndexPath(index, atScrollPosition: UITableViewScrollPositionBottom, animated: true)
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController didChangeOffset:(CGFloat)offset orientation:(IIViewDeckOffsetOrientation)orientation panning:(BOOL)panning {
  #     [self addLog:[NSString stringWithFormat:@"%@: %f", panning ? @"Pan" : @"Offset", offset]];
  # }
  def viewDeckController(viewDeckController, didChangeOffset: offset, orientation: orientation, panning: panning)
    self.addLog([(panning ? "Pan" : "Offset"), offset].join(": "))
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController willOpenViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"will open %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, willOpenViewSide: viewDeckSide, animated: animated)
    self.addLog("will open #{NSStringFromIIViewDeckSide(viewDeckSide)} view")
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController didOpenViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"did open %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, didOpenViewSide: viewDeckSide, animated: animated)
    self.addLog("did open #{NSStringFromIIViewDeckSide(viewDeckSide)} view")
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController willCloseViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"will close %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, willCloseViewSide: viewDeckSide, animated: animated)
    self.addLog("will close #{NSStringFromIIViewDeckSide(viewDeckSide)} view")
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController didCloseViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"did close %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, didCloseViewSide:viewDeckSide, animated: animated)
    self.addLog("did close #{NSStringFromIIViewDeckSide(viewDeckSide)} view")
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController didShowCenterViewFromSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"did show center view from %@", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, didShowCenterViewFromSide: viewDeckSide, animated: animated)
    self.addLog("did show center view from #{NSStringFromIIViewDeckSide(viewDeckSide)}")
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController willPreviewBounceViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"will preview bounce %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, willPreviewBounceViewSide: viewDeckSide, animated: animated)
    self.addLog("will preview bounce #{NSStringFromIIViewDeckSide(viewDeckSide)} view")
  end

  # - (void)viewDeckController:(IIViewDeckController *)viewDeckController didPreviewBounceViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
  #     [self addLog:[NSString stringWithFormat:@"did preview bounce %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
  # }
  def viewDeckController(viewDeckController, didPreviewBounceViewSide: viewDeckSide, animated: animated)
    self.addLog("did preview bounce #{NSStringFromIIViewDeckSide(viewDeckSide)} view")
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
    self.logs.size
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
    puts "Logs #{indexPath.row}: #{self.logs[indexPath.row]}"
    cell.textLabel.text = self.logs[indexPath.row]
    cell
  end

end