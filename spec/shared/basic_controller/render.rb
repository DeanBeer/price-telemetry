shared_examples_for :correct_template_render do
  it 'renders the right template' do
    expect(subject).to render_template template
  end
end
