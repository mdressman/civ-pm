require 'spec_helper'

describe Milestone do
	let(:user) { FactoryGirl.create(:user) }
	before { 20.times { FactoryGirl.create(:milestone) } }
end
