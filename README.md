xmandrill
=========

<p>A simple API wrapper for Mandrill</p>
=================================

# Get started

<p>gem install xmandrill</p>
======================

# Examples
- 1. Make an API call.
	<code>
		@xm = Xmandrill::API.new("valid-api-key")

		@xm.users_info
	</code>

- 2. Send email with customized Mustache template.<br/>
	If you have the following code in ``template.html``
	<code>
		<html>
			<head></head>
			<body>
				Hi {{name}}
			
				Please download your order <a href="{{link}}">here</a>.
			
				{{#shipping}}
					You'll also receive a hard copy to {{address}}.
				{{/shipping}}
			</body>
		</html>
	
    	@html = @xm.html('path/to/template.html', name: "Fred", link: "http://example.com/orders", shipping: true, address: "Number Street, Suburb Postcode")
	</code>
	It will return:
	<code>
		<html>
			<head></head>
			<body>
				Hi Fred
			
				Please download your order <a href="http://example.com/orders">here</a>.
			
				You'll also receive a hard copy to Number Street, Suburb Postcode.
			</body>
		</html>
	</code>

	Then pass the template to your API call.
	<code>
		@xm.messages_send({<br/>
		    message: {<br/>
		        html: @html,<br/>
		        text: "Example text content",<br/>
		        subject: "example subject",<br/>
		        from_email: "message.from_email@example.com",<br/>
		        from_name: "Example Name",<br/>
		        to: [<br/>
		            {<br/>
		                email: "recipient.email@example.com",<br/>
		                name: "Recipient Name"<br/>
		            }<br/>
		        ],<br/>
		        headers: {<br/>
		            "Reply-To": "message.reply@example.com"<br/>
		        },<br/>
		        important: false,<br/>
		        track_opens: null,<br/>
		        track_clicks: null,<br/>
		        auto_text: null,<br/>
		        auto_html: null,<br/>
		        inline_css: null,<br/>
		        url_strip_qs: null,<br/>
		        preserve_recipients: null,<br/>
		        view_content_link: null,<br/>
		        bcc_address: "message.bcc_address@example.com",<br/>
		        tracking_domain: null,<br/>
		        signing_domain: null,<br/>
		        return_path_domain: null,<br/>
		        merge: true,<br/>
		        global_merge_vars: [<br/>
		            {<br/>
		                "name": "merge1",<br/>
		                "content": "merge1 content"<br/>
		            }<br/>
		        ],<br/>
		        merge_vars: [<br/>
		            {<br/>
		                "rcpt": "recipient.email@example.com",<br/>
		                "vars": [<br/>
		                    {<br/>
		                        "name": "merge2",<br/>
		                        "content": "merge2 content"<br/>
		                    }<br/>
		                ]<br/>
		            }<br/>
		        ],<br/>
		        tags: [<br/>
		            "password-resets"<br/>
		        ],<br/>
		        subaccount: "customer-123",<br/>
		        google_analytics_domains: [<br/>
		            "example.com"<br/>
		        ],<br/>
		        google_analytics_campaign: "message.from_email@example.com",<br/>
		        metadata: {<br/>
		            "website": "www.example.com"<br/>
		        },<br/>
		        recipient_metadata: [<br/>
		            {<br/>
		                "rcpt": "recipient.email@example.com",<br/>
		                "values": {<br/>
		                    "user_id": 123456<br/>
		                }<br/>
		            }<br/>
		        ],<br/>
		        attachments: [<br/>
		            {<br/>
		                "type": "text/plain",<br/>
		                "name": "myfile.txt",<br/>
		                "content": "ZXhhbXBsZSBmaWxl"<br/>
		            }<br/>
		        ],<br/>
		        images: [<br/>
		            {<br/>
		                "type": "image/png",<br/>
		                "name": "IMAGECID",<br/>
		                "content": "ZXhhbXBsZSBmaWxl"<br/>
		            }<br/>
		        ]<br/>
		    },<br/>
		    async: false,<br/>
		    ip_pool: "Main Pool",<br/>
		    send_at: "example send_at"<br/>
		})<br/>
	</code>

