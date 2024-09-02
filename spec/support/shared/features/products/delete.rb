shared_examples_for 'Delete Product' do
  scenario 'Can delete product' do
    sign_in(user)
    visit product_path(product)
    click_on 'Delete'

    expect(page).to have_content 'Your product has been deleted.'
    %i[title description specification price].each do |attr|
      expect(page).to have_no_content product.send(attr)
    end
  end
end
