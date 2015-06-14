class ResultsController < ApplicationController
  before_action :set_match
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  def new
    @result = @match.build_result
  end

  def edit
  end

  def update
    @result.update(result_params)
    @result.save
    redirect_to match_path(@match)
  end

  def create
    @match = Match.find(params[:match_id])
    @result = @match.build_result(result_params)
    @result.save
    redirect_to match_path(@match)
  end

  private
  def set_match
    @match = Match.find(params[:match_id])
  end
  def set_result
    @result = @match.result
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def result_params
    params.require(:result).permit(:player1_score, :player2_score, :description, :videourl)
  end
end
