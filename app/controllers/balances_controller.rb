class BalancesController < ApplicationController
  def index
  	@transacciones2 = Account.select("accounts.id AS cuenta,
  								accounts.name AS name, 
  								accounts.codigo AS codigo,
  								(SELECT SUM(monto) from deals  where (tipo=1 AND  accounts.id = deals.account_id)) AS sum_debe,
  								(SELECT SUM(monto) from deals  where (tipo=2 AND  accounts.id = deals.account_id)) AS sum_haber
  								")#.where(id: @lista)
  						.joins("INNER JOIN deals ON accounts.id = deals.account_id ")
  						.joins("INNER JOIN movements ON movements.id = deals.movement_id").group("accounts.id")

  end
end
