LINE_SEPARATOR = "\n"
VALID_RANGE = (0..9)

def identify_account(account_number)
  readed_account = OCR::Splitter.new(account_number)
  lines = readed_account.lines

  readers = %w(One Two Three Four Five Six Seven)

  readers.each do |reader|
    klass = OCR::Readers.const_get(reader)
    return klass.value if klass.match?(lines)
  end
end

module OCR
  class Splitter
    def initialize(account_number)
      @account_number = account_number
    end

    def lines
      line(@account_number)
    end

    def line(account_number)
      @account_number.split(LINE_SEPARATOR)
    end
  end

  module Readers
    class Reader
      class << self
        def match?(lines)
          matchers.all? do |matcher|
            lines[matcher[:position]] == matcher[:matcher]
          end
        end

        private

        def matchers
          raise 'should be implemented in a subclass'
        end
      end
    end

    class One < Reader
      class << self
        def value
          1
        end

        private

        def matchers
          [
            {
              position: 0,
              matcher: '   '
            },
            {
              position: 1,
              matcher: '  |'
            }
          ]
        end
      end
    end

    class Two < Reader
      class << self
        def value
          2
        end

        private

        def matchers
          [
            {
              position: 2,
              matcher: '|_ '
            }
          ]
        end
      end
    end

    class Three < Reader
      class << self
        def value
          3
        end

        private

        def matchers
          [
            {
              position: 1,
              matcher: ' _|'
            },
            {
              position: 2,
              matcher: ' _|'
            }
          ]
        end
      end
    end

    class Four < Reader
      class << self
        def value
          4
        end

        private

        def matchers
          [
            {
              position: 1,
              matcher: '|_|'
            }
          ]
        end
      end
    end

    class Five < Reader
      class << self
        def value
          5
        end

        private

        def matchers
          [
            {
              position: 1,
              matcher: '|_ '
            },
            {
              position: 2,
              matcher: ' _|'
            }
          ]
        end
      end
    end

    class Six < Reader
      class << self
        def value
          6
        end

        private

        def matchers
          [
            {
              position: 2,
              matcher: '|_|'
            }
          ]
        end
      end
    end

    class Seven < Reader
      class << self
        def value
          7
        end

        private

        def matchers
          [
            {
              position: 1,
              matcher: '  |'
            },
            {
              position: 2,
              matcher: '  |'
            }
          ]
        end
      end
    end
  end
end