class PagesController < ApplicationController
  def index
  end

  def person
    age_a = params[:age_a].to_i > 0 ? params[:age_a].to_i : -1
    year_a = params[:year_a].to_i > 0 ? params[:year_a].to_i : -1
    age_b = params[:age_b].to_i > 0 ? params[:age_b].to_i : -1
    year_b = params[:year_b].to_i > 0 ? params[:year_b].to_i : -1
    # Person A calculation
    a = ( year_a - age_a )
    killed_by_a = fibonacci(a)
    answer_1 = "Person A born on Year = #{year_a} - #{age_a} = #{a}, number of people killed on year #{a} is #{killed_by_a}."

    # Person B calculation
    b = ( year_b - age_b )
    killed_by_b = fibonacci(b)
    answer_2 = "Person B born on Year = #{year_b} - #{age_b} = #{b}, number of people killed on year #{b} is #{killed_by_b}."

    # Get average 
    persons = [ killed_by_b, killed_by_a ]
    answer_3 = "So the average is (#{persons[1]}+#{persons[0]})/#{persons.size} = #{average(persons)}"

    respond_to do |format|
      format.json { render json: {"answer_1": "#{answer_1}", "answer_2": "#{answer_2}", "answer_3": "#{answer_3}"} }
    end
  end

  def fibonacci(n)
    if n <= 0
      fib = [0]
    elsif n == 1
      fib = [1]
    else
      fib = [1,1]
      (n-2).times do
        fib << fib[-1] + fib[-2]
      end
    end
    fib.sum
  end

  def average(numbers)
    numbers.inject{ |sum, el| sum + el }.to_f / numbers.size
  end

end
