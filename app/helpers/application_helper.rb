module ApplicationHelper

	def oauth

		"https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/devstorage.read_write&redirect_uri=<%=ENV['GOOGLE_REDIRECT_URIS']%>&response_type=code&client_id=<%=ENV['GOOGLE_CLIENT_ID']"	
	end
end
