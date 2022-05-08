class LineItemDatesController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date, only: %i[show edit update destroy]

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

  # PATCH/PUT /line_item_dates/1 or /line_item_dates/1.json
  def update
    respond_to do |format|
      if @line_item_date.update(line_item_date_params)
        format.html do
          redirect_to line_item_date_url(@line_item_date), notice: 'Line item date was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @line_item_date }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_item_dates/1 or /line_item_dates/1.json
  def destroy
    @line_item_date.destroy

    respond_to do |format|
      format.html { redirect_to line_item_dates_url, notice: 'Line item date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end
end
