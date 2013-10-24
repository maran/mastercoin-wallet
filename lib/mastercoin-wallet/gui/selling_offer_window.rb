module MastercoinWallet 
  class SellingOfferWindow < Qt::Dialog
    include Bitcoin::Builder

    def initialize(parent=nil)
      super(parent)

      @ui = Ui_SellingOffer.new
      @ui.setupUi(self)
    end
  end
end
