# Instance Variables
shared_examples_for :correct_instance_variables do
  it "sets the right instance variable(s)" do
    if defined? ivars
      ivars.each do |ivar|
        if ivar.is_a?(Hash)
          name = ivar[:name]
          value = ivar[:value]
        else
          name = ivar
        end
        if value
          expect(assigns name).to eq value
        else
          expect(assigns name).to_not be_nil
        end
        name = value = nil
      end
    end
    if defined? ivar
      expect(assigns ivar).to_not be_nil
    end
  end
end
