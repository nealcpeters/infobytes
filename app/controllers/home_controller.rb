class HomeController < ApplicationController

  def index
    
  end

  def pdf
  	respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
				pdf.text "Hello World"
				send_data pdf.render, filename: "pdf.pdf", type: "application/pdf"
      end
    end
  end
end