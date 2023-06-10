def login(user)
  within('form') do
    fill_in 'E-mail', with: user.email
    fill_in 'Senha', with: user.password
  end

  click_on 'Log in'
end
