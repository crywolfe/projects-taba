module ApplicationHelper

	def oauth
    google_redirect = ENV['GOOGLE_REDIRECT_URIS']
    google_client = ENV['GOOGLE_CLIENT_ID']
		"https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/devstorage.read_write&redirect_uri=#{google_redirect}&response_type=code&client_id=#{google_client}"	
	end
end
