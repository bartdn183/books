module HomeHelper

	def null?(info)
		if info == nil || info == ""
            "N/A"
        else
           info
        end
	end
end
