class LeftViewController < UITableViewController

  def viewDidLoad
    super
    self.tableView.scrollsToTop = false
    # Uncomment the following line to preserve selection between presentations.
    # self.clearsSelectionOnViewWillAppear = false

    # Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    # self.navigationItem.rightBarButtonItem = self.editButtonItem
  end

  # - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
  # {
  #     return 4 + arc4random() % 10;
  # }
  def numberOfSectionsInTableView(tableView)
    5
  end

  # - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
  # {
  #     return section == 0 ? 1 : 3 + arc4random() % 50;
  # }
  def tableView(tableView, numberOfRowsInSection: section)
    section == 0 ? 1 : 3 + rand(50)
  end


  # - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  #     return section > 0 ? [NSString stringWithFormat:@"%d", section-1] : nil;
  # }
  def tableView(tableView, titleForHeaderInSection: section)
    #section
  end

  # - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
  # {
  #     static NSString *CellIdentifier = @"Cell";

  #     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  #     if (cell == nil) {
  #         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  #     }

  #     if (indexPath.section == 0) {
  #         cell.accessoryType = UITableViewCellAccessoryNone;
  #         cell.textLabel.text = @"Switch to right";
  #     }
  #     else {
  #         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  #         cell.textLabel.text = [NSString stringWithFormat:@"%d:%d", indexPath.section-1, indexPath.row];
  #     }
  #     return cell;
  # }
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cellIdentifier = "Cell"
    cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
    cell ||= UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: cellIdentifier)
    if indexPath.section == 0
      cell.accessoryType = UITableViewCellAccessoryNone
      cell.textLabel.text = "Switch to right"
    else
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
      cell.textLabel.text = [indexPath.section-1, indexPath.row].join(":")
    end
    cell
  end


  #pragma mark - Table view delegate

  # - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
  # {
  #     [tableView deselectRowAtIndexPath:indexPath animated:YES];
  #     if (indexPath.section == 0) {
  #         [self.viewDeckController toggleOpenView];
  #         return;
  #     }
  #     [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
  #         if ([controller.centerController isKindOfClass:[UINavigationController class]]) {
  #             UITableViewController* cc = (UITableViewController*)((UINavigationController*)controller.centerController).topViewController;
  #             cc.navigationItem.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
  #             if ([cc respondsToSelector:@selector(tableView)]) {
  #                 [cc.tableView deselectRowAtIndexPath:[cc.tableView indexPathForSelectedRow] animated:NO];
  #             }
  #         }
  #         [NSThread sleepForTimeInterval:(300+arc4random()%700)/1000000.0]; // mimic delay... not really necessary
  #     }];
  # }

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    if indexPath.section == 0
      self.viewDeckController.toggleOpenView
      return
    end

    self.viewDeckController.closeLeftViewBouncing(
      Proc.new { |controller|
        if controller.centerController.is_a?(UINavigationController)
          cc = controller.centerController.topViewController
          cc.navigationItem.title = tableView.cellForRowAtIndexPath(indexPath).textLabel.text
          if cc.respond_to?(:tableView)
            cc.tableView.deselectRowAtIndexPath(cc.tableView.indexPathForSelectedRow, animated: false)
          end
        end
      }
    )
  end

end