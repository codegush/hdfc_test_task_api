# frozen_string_literal: true
module Errors
  class ApiError
    def initialize(error_type, message: nil)
      @status  = Rack::Utils::SYMBOL_TO_STATUS_CODE.fetch(error_type)
      @type    = error_type.to_s
      @message = message
    end

    def to_json(_)
      errors = {
        status: status.to_s,
        code:   type.dasherize,
        title:  "#{status} (#{type.humanize(capitalize: false)})"
      }
      errors[:detail] = message if message

      { errors: [errors] }.to_json
    end

  private

    attr_reader :status, :type, :message
  end
end
