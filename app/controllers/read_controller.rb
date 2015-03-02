class ReadController < ApplicationController

  def index
    @content = ''
    session[:lines] = nil
  end

  def confirm

    lines = session[:lines]
    begin
      if lines == nil && params[:file]
        lines = []
        count = 1
        open(params[:file].path) {|f|
          while rec = f.gets
            lines << {num: count, line: "#{rec}"}
            count += 1
          end
        }
        session[:lines] = lines
      end
      @data = Kaminari.paginate_array(lines).page(params[:page]).per(20)
    rescue => ex
      flash[:notice] = ex.to_s
      redirect_to(read_path)
      return
    end
  end
end
