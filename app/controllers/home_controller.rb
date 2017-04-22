class HomeController < ApplicationController
  add_breadcrumb "Home", :home_index_path


  def index
    if !current_user.blank?
      @quote = current_user.quotes.new
      @questionaire = @quote.build_questionaire
      @quote_detail = @quote.build_quote_detail
    else
      @quote = Quote.new
      @products = Product.all
      @questionaire = @quote.build_questionaire
      @quote_detail = @quote.build_quote_detail
    end
  end

  def submit_questionaire
    @quote = Quote.new(params[:combo_params])
    if @quote.save
      flash[:notice]  = "Quote sent"
      redirect_to home_index_path
    else
      flash[:danger] = "Error!"
    end
  end

  def about
  end

  def pending
  end

  def exit
  end

    private

    def combo_params
      params.require(:quote).permit(:quote_type ,:user_id, :pending, questionaire: [ :user_id, :quote_id, :product_type, :comments ])
    end

    def questionaire_params
      params.require(:questionaire).permit(:user_id, :quote_id, :product_type, :comments)
    end

    def quote_params
      params.require(:quote).permit(:quote_type, :user_id, :approved, :pending, :rejected)
    end

end
