class ViewController < UITableViewController

  attr_accessor :popoverController

  # - (void)viewDidLoad
  # {
  #     [super viewDidLoad];

  #     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
  #     if ([self.navigationItem respondsToSelector:@selector(leftBarButtonItems)]) {
  #         self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:
  #                                                   [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)],
  #                                                   [[UIBarButtonItem alloc] initWithTitle:@"bounce" style:UIBarButtonItemStyleBordered target:self action:@selector(previewBounceLeftView)],
  #                                                   nil];
  #     } else {
  #         self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
  #     }
  #     if ([self.navigationItem respondsToSelector:@selector(rightBarButtonItems)]) {
  #         self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:
  #                                                    [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleRightView)],
  #                                                    [[UIBarButtonItem alloc] initWithTitle:@"bounce" style:UIBarButtonItemStyleBordered target:self action:@selector(previewBounceRightView)],
  #                                                    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(showCam:)],
  #                                                    nil];
  #     }
  #     else {
  #         self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleRightView)];
  #     }
  # }

  def viewDidLoad
    super
    self.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle(
                                              "left",
                                              style: UIBarButtonItemStyleBordered,
                                              target: self.viewDeckController,
                                              action: 'toggleLeftView'
                                            )
    if self.navigationItem.respond_to?(:leftBarButtonItems)
      self.navigationItem.leftBarButtonItems = [
        UIBarButtonItem.alloc.initWithTitle(
          "left",
          style: UIBarButtonItemStyleBordered,
          target: self.viewDeckController,
          action: 'toggleLeftView'
        ),
        UIBarButtonItem.alloc.initWithTitle(
          "bounce",
          style: UIBarButtonItemStyleBordered,
          target: self,
          action: 'previewBounceLeftView'
        )
      ]
    else
      self.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle(
        "left",
        style: UIBarButtonItemStyleBordered,
        target: self.viewDeckController,
        action: 'toggleLeftView'
      )
    end

    if self.navigationItem.respond_to?(:rightBarButtonItems)
      self.navigationItem.rightBarButtonItems = [
        UIBarButtonItem.alloc.initWithTitle(
          "right",
          style: UIBarButtonItemStyleBordered,
          target: self.viewDeckController,
          action: 'toggleRightView'
        ),
        UIBarButtonItem.alloc.initWithTitle(
         "bounce",
         style: UIBarButtonItemStyleBordered,
         target: self,
         action: 'previewBounceRightView'
        )
      ]
    else
      self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithTitle(
        "right",
        style: UIBarButtonItemStyleBordered,
        target: self.viewDeckController,
        action: 'toggleRightView'
      )
    end
  end

  # - (void)viewWillAppear:(BOOL)animated
  # {
  #     [super viewWillAppear:animated];
  #     [self.viewDeckController openLeftViewAnimated:NO];
  # }
  def viewWillAppear(animated)
    super
    self.viewDeckController.openLeftViewAnimated(false)
  end

  # - (void)viewDidAppear:(BOOL)animated
  # {
  #     [super viewDidAppear:animated];
  #     [self.viewDeckController closeLeftViewAnimated:YES];
  # }
  def viewDidAppear(animated)
    super
    self.viewDeckController.closeLeftViewAnimated(true)
  end

  # - (void)previewBounceLeftView {
  #     [self.viewDeckController previewBounceView:IIViewDeckLeftSide];
  # }
  def previewBounceLeftView
    self.viewDeckController.previewBounceView(IIViewDeckLeftSide)
  end

  # - (void)previewBounceRightView {
  #     [self.viewDeckController previewBounceView:IIViewDeckRightSide];
  # }
  def previewBounceRightView
    self.viewDeckController.previewBounceView(IIViewDeckRightSide)
  end

  # - (void)previewBounceTopView {
  #     [self.viewDeckController previewBounceView:IIViewDeckTopSide];
  # }
  def previewBounceTopView
    self.viewDeckController.previewBounceView(IIViewDeckTopSide)
  end

  # - (void)previewBounceBottomView {
  #     [self.viewDeckController previewBounceView:IIViewDeckBottomSide];
  # }
  def previewBounceBottomView
    self.viewDeckController.previewBounceView(IIViewDeckBottomSide)
  end

  # - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
  # {
  #     return 2;
  # }
  def numberOfSectionsInTableView(tableView)
    2
  end

  # - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
  # {
  #     return 6;
  # }
  def tableView(tableView, numberOfRowsInSection: section)
    6
  end

  # - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  #     return !section ? @"Left" : @"Right";
  # }
  def tableView(tableView, titleForHeaderInSection: section)
    !section ? "Left" : "Right"
  end

  # - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
  # {
  #     static NSString *CellIdentifier = @"Cell";
  #     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  #     if (cell == nil) {
  #         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  #     }
  #     cell.textLabel.textAlignment = indexPath.section ? UITextAlignmentRight : UITextAlignmentLeft;
  #     cell.textLabel.text = [NSString stringWithFormat:@"ledge: %d", indexPath.row*44];
  #     return cell;
  # }
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cellIdentifier = "Cell"
    cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
    cell ||= UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: cellIdentifier)
    cell.textLabel.textAlignment = indexPath.section ? UITextAlignmentRight : UITextAlignmentLeft
    cell.textLabel.text = "ledge: #{indexPath.row*44}"
    cell
  end


  # #pragma mark - Table view delegate

  # # - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
  # # {
  # #     if (!indexPath.section) {
  # #         self.viewDeckController.leftSize = MAX(indexPath.row*44,10);
  # #     }
  # #     else {
  # #         self.viewDeckController.rightSize = MAX(indexPath.row*44,10);
  # #     }
  # # }
  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    if !indexPath.section
      self.viewDeckController.leftSize = [indexPath.row*44, 10].max
    else
      self.viewDeckController.rightSize = [indexPath.row*44, 10].max
    end
  end

end