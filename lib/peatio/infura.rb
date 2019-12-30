require "peatio/infura/version"
require "active_support/core_ext/object/blank"
require "peatio"

module Peatio
  module Infura
    require "peatio/infura/client"
    require "peatio/infura/blockchain"
    require "peatio/infura/wallet"
    require "peatio/infura/password_generator"

    require "peatio/infura/hooks"
    require "peatio/infura/version"
  end
end
