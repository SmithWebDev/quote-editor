class LineItemDatesController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date, only: %i[edit update destroy]

  def edit; end

  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)

    respond_to do |format|
      if @line_item_date.save
        format.html { redirect_to quote_path(@quote), notice: 'Line item date was successfully created.' }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    if @line_item_date.update(line_item_date_params)
      redirect_to quote_path(@quote), notice: 'Date was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /line_item_dates/1 or /line_item_dates/1.json
  def destroy
    @line_item_date.destroy

    respond_to do |format|
      format.html { redirect_to quote_path(@quote), notice: 'Date was successfully destroyed.' }
    end
  end

  private

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:id])
  end

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end
end
