class MayorGeneralController < ApplicationController
  def index
  	@transacciones = Account.select("accounts.name as name, deals.created_at AS fecha,deals.account_id AS cuenta, deals.tipo AS tipo,deals.monto as monto,deals.referencia_m AS referencia")
  	                 .joins(:deals).order("accounts.id")
  	@transacciones2 = Account.select("accounts.id AS cuenta,accounts.name AS name, accounts.codigo AS codigo").joins(:deals).group("accounts.id")
  end
end
