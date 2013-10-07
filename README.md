xmandrill
=========

A simple API wrapper for Mandrill
  
# Get started  
gem install xmandrill  

# Examples  
1. Make a simple API call.  
``@xm = Xmandrill::API.new("valid-api-key")  
@xm.users_info``  

2. Send email with customized Mustache template.  
In ``template.html``:  
<code>  
`<html>`  
	`<body>`  
		Hi {{name}}  

		Please download your order <a href="{{link}}">here</a>.  

		{{#shipping}}  
			You'll also receive a hard copy to {{address}}.  
		{{/shipping}}  
	`</body>`  
`</html>`  
</code>  
``@html = @xm.html("path/to/template.html",<br/>
					name: "Fred",<br/>
					link: "http://example.com/orders",<br/>
					shipping: true,<br/>
					address: "Number Street, Suburb Postcode")``  

It will return:  
<code>  
	`<html>`  
		`<body>`  
			Hi Fred  

			Please download your order <a href="http://example.com/orders">here</a>.  

			You'll also receive a hard copy to Number Street, Suburb Postcode.  
		`</body>`   
	`</html>`  
</code>  