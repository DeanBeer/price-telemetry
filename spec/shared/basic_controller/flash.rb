shared_examples_for :flash_messaging do
  it 'sets the right flash message' do
    if defined? flash_message
      expect(subject).to set_the_flash[flash_key].to(flash_message)
    else
      expect(subject).to set_the_flash[flash_key]
    end
  end
end


shared_examples_for :failure_flash_messaging do
  it_behaves_like :flash_messaging do; let(:flash_key) { :error }; end
end


shared_examples_for :success_flash_messaging do
  it_behaves_like :flash_messaging do; let(:flash_key) { :success }; end
end


shared_examples_for :unflashy_messaging do
  it 'does not set the flash' do
    expect(subject).to_not set_the_flash
  end
end
