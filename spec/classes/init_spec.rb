require 'spec_helper'
describe 'pedemo' do

  context 'with defaults for all parameters' do
    it { should contain_class('pedemo') }
  end
end
