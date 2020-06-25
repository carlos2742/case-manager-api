def valid_client_attributes
  FactoryBot.attributes_for(:client).as_json
end

def same_user_attributes
  FactoryBot.attributes_for(:user).merge(:email => 'user@gmail.com',:password => 'qwertyuiop').as_json
end

def valid_user_attributes
  FactoryBot.attributes_for(:user).as_json
end

def create_client
  Client.create(valid_client_attributes)
end