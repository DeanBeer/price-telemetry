shared_examples_for :edit do

    it "sets the right instance variable" do
      expect(assigns ivar).to_not be_nil
    end

    it 'renders :edit' do
      expect(subject).to render_template :edit
    end

end
