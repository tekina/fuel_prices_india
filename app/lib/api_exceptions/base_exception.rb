module ApiExceptions
  class BaseException < StandardError

    ATTRIBUTES = [:msg, :http_status_code]

    attr_accessor(*ATTRIBUTES)

    def initialize(msg = nil, http_status_code = 400)
      @msg = msg || errors[:msg]
      @http_status_code = http_status_code
    end

  end
end
