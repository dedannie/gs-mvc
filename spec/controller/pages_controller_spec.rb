require "rails_helper"

RSpec.describe PagesController, :type => :controller do
  describe PagesController do
    it 'fibonacci should return 7' do
      controller.fibonacci(4).should == 7
    end
    it 'average should return 4.5' do
      controller.average([2, 7]).should == 4.5
    end
  end
end