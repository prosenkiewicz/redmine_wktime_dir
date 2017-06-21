class WksupplierinvoiceController < WksupplierorderentityController
  unloadable



	def newSupOrderEntity(parentId, parentType)
		super			
		@poId =params[:po_id].to_i
		if !params[:populate_items].blank? && params[:populate_items] == '1'
			@invoiceItem = WkInvoiceItem.where(:invoice_id => params[:po_id].to_i).select(:name, :rate, :amount, :quantity, :item_type, :currency, :project_id, :modifier_id,  :invoice_id )
		end 
	end

  
	def getInvoiceType
		'SI'
	end
	
	def getHeaderLabel
		l(:label_supplier_invoice)
	end
	
	def getLabelNewInv
		l(:label_new_sup_invoice)
	end
		
	def getPopulateChkBox
		l(:label_populate_purchase_items)
	end
	
	def getItemLabel
		l(:label_si_items)
	end
	
	def getLabelInvNum
		l(:label_sp_number)
	end
	
	def getDateLbl
		l(:label_sp_date)
	end
	
	def requirePoDD
		true
	end
	
end