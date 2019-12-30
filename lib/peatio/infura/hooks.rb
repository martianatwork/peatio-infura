module Peatio
  module Infura
    module Hooks
      class << self
        def check_compatibility
          if Peatio::Blockchain::VERSION >= '2.0'
            [
              "Infura plugin was designed for work with 1.x. Blockchain.",
              "You have #{Peatio::Infura::Blockchain::VERSION}."
            ].join('\n').tap { |s| Kernel.abort s }
          end

          if Peatio::Wallet::VERSION >= '2.0'
            [
              "Infura plugin was designed for work with 1.x. Wallet.",
              "You have #{Peatio::Infura::Wallet::VERSION}."
            ].join('\n').tap { |s| Kernel.abort s }
          end
        end

        def register
          Peatio::Blockchain.registry[:infura] = Infura::Blockchain.new
          Peatio::Wallet.registry[:infurad] = Infura::Wallet.new
        end
      end

      if defined?(Rails::Railtie)
        require "peatio/infura/railtie"
      else
        check_compatibility
        register
      end
    end
  end
end
