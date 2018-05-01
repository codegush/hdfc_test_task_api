require 'jwt'

class Auth

  ALGORITHM = 'HS256'
  ISSUER = 'HEYDAY_TECHNOLOGIES_PVT_LTD'

  def self.issue(payload)
    exp = Time.now.to_i + 4 * 3600
    iat = Time.now.to_i

    payload = payload.merge({ exp: exp, iss: ISSUER, iat: iat })
    JWT.encode(
      payload,
      auth_secret,
      ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, auth_secret, true, { iss: ISSUER, verify_iss: true, verify_iat: true, algorithm: ALGORITHM }).first
  end

  def self.auth_secret
    ENV['AUTH_SECRET']
  end
end
