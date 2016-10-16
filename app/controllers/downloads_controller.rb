class DownloadsController < ApplicationController

  def show
    sub = params[:id].split("-")[0].downcase
    fh = params[:id] + ".pdf"
    send_file Rails.root.join('private', sub, fh), :type=>"application/pdf", :x_sendfile=>true
  end
  
end
