# JWT porvides 'encode' and 'decode' methods,
# but they require multiple arguments: payload, SECRET, ALGORITHM
# Adapter modifies each method's behavior
# and takes care about all common arguments (SECRET, ALGORITHM)
# so we are required to provide only payload
class JwtAdapter
  SECRET = ENV['SECRET_KEY_BASE']
  ALGORITHM = 'HS512'.freeze

  def encode(payload)
    JWT.encode(payload, SECRET, ALGORITHM)
  end

  def decode(token)
    JWT.decode(token, SECRET, true, algorithm: ALGORITHM)
  end
end
