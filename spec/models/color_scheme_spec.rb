require 'spec_helper'

describe ColorScheme do
  describe ".find_color" do
    let(:color) {"1"}
    subject {ColorScheme.find_color(color)}
    it { should eq 'Red.jpg'}
  end
end
