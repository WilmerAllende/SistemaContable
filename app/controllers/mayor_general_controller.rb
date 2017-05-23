class MayorGeneralController < ApplicationController
	# <td><%= movement.comentario %></td>
    # <td><%= link_to 'Show', movement %></td>
    # <td><%= link_to 'Edit', edit_movement_path(movement) %></td>
    # <td><%= link_to 'Destroy', movement, method: :delete, data: { confirm: 'Are you sure?' } %></td>
  def index
  	#@transacciones = Account.select("accounts.name as name, deals.created_at AS fecha,deals.account_id AS cuenta, deals.tipo AS tipo,deals.monto as monto,deals.referencia_m AS referencia")
  	#                 .joins(:deals).order("accounts.id")
  	@transacciones = Account.select("movements.fecha AS fecha_movements,accounts.name as name, deals.created_at AS fecha,deals.account_id AS cuenta, deals.tipo AS tipo,deals.monto as monto,deals.referencia_m AS referencia")
  			.joins("INNER JOIN deals ON accounts.id = deals.account_id ")
  			.joins("INNER JOIN movements ON movements.id = deals.movement_id")
  	@transacciones2 = Account.select("accounts.id AS cuenta,accounts.name AS name, accounts.codigo AS codigo").joins(:deals).group("accounts.id")
  end
end
