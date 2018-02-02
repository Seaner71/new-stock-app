require 'rails_helper'

RSpec.describe 'routing to accounts' do
  # RESTFUL routes
  it 'routes /accounts/stocks to stocks#index' do
    expect(get: "/accounts/1/stocks").to route_to(
      controller: "stocks",
      action: "index",
      account_id: '1'
    )
  end

end
