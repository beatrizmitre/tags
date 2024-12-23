class PrintButtonClicksController < ApplicationController
  def create
    PrintButtonClick.create! tag_id: params[:tag_id]
  end
end
