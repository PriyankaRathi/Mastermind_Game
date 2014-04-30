require 'spec_helper'

describe ColorScheme do
  describe ".color_image_name_from_color_id" do
    let(:color) { "1" }
    subject { ColorScheme.color_image_name_from_color_id(color) }
    it { expect(subject).to eq 'Red.jpg' }
  end

  describe ".last_color_id" do
    subject { ColorScheme.last_color_id }
    it { expect(subject).to eq 5 }
  end
end
