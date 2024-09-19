shared_examples_for 'User does not exist' do
  it 'redirect to new_user_session_path' do
    do_request
    expect(response).to redirect_to new_user_session_path
  end
end
