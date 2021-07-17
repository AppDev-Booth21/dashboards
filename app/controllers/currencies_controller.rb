class CurrenciesController < ApplicationController
  def first_currency
    
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys
    
    render({ :template => "currency_templates/step_one.html.erb"})
  end

  def second_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @from_symbol = params.fetch("from_currency")


    @array_of_symbols = @symbols_hash.keys
    render({ :template => "currency_templates/step_two.html.erb"})
  end

  def convert
    #@raw_data = open("https://api.exchangerate.host/convert").read
    @raw_data = open("https://api.exchangerate.host/convert?from=&to=").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash1 = @parsed_data.fetch("query")
    @symbols_hash2 = @parsed_data.fetch("info")

    @from_symbol = params.fetch("from_currency")
    @to_symbol = params.fetch("to_currency")

    @amount = @symbols_hash1.fetch("amount")
    @rate = 

    
    render({ :template => "currency_templates/step_three.html.erb"})
  end

end
