class SuggestionsController < ApplicationController

  active_scaffold :suggestion do |config|
    config.columns = [:title, :rating, :public]
    config.columns[:rating].form_ui = :select
    config.columns[:rating].options = {:options => [['Must have right now', 'urgent'], ['Can wait til tomorrow', 'moderate'], ['When you get to it', 'later']]}
    config.columns[:public].form_ui = :checkbox
  end

  private

  def before_create_save(record)
    record.user = User.find(params[:user_id])
  end

  def conditions_for_collection
    ['user_id = ?', params[:user_id]]
  end

end
