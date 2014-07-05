shared_examples_for :working_in_the_factory do

  it 'factory builds a valid model' do
    expect(subject).to be_valid
  end

end
