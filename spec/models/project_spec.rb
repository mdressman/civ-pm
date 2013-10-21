require 'spec_helper'

describe Project do
  before do
        @project = Project.new(name: "Example Project")
    end

    subject { @project }

    it { should respond_to(:name) }
end
