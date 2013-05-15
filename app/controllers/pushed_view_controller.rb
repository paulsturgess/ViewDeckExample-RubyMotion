class PushedViewController < UIViewController

  def viewDidLoad
    super
    background = UIImageView.alloc.initWithFrame(self.view.bounds)
    background.image = UIImage.imageNamed('bg.jpg')
    background.contentMode = UIViewContentModeScaleToFill
    background.userInteractionEnabled = false
    view.addSubview(background)
  end

end