xmandrill
=========

A simple API wrapper for Mandrill
  
# Get started  
gem install xmandrill  

## Examples  
1. Make a simple API call.  
``@xm = Xmandrill::API.new("valid-api-key")``  
``@xm.users_info``  

2. Send email with customized Mustache template.  
In ``template.html``:

<pre><code>
	`<html>`  
		`<body>`  
			`<p>`Hi {{name}}`</p>`  
			`<p>`Please download your order `<a href="{{link}}">`here`</a>`.`</p>`  
			{{#shipping}}  
				`<p>`You'll also receive a hard copy to {{address}}.`</p>`  
			{{/shipping}}  
		`</body>`  
	`</html>`  
</code></pre>
 
<pre><code>
	@html = @xm.html("path/to/template.html",
                    name: "Fred",
					link: "http://example.com/orders",
					shipping: true,
					address: "Number Street, Suburb Postcode")
</pre></code>

It will return:  
<pre><code>  
    `<html>`  
        `<body>`  
            `<p>`Hi Fred`</p>`  
            `<p>`Please download your order `<a href="http://example.com/orders">`here`</a>`.`</p>`  
            `<p>`You'll also receive a hard copy to Number Street, Suburb Postcode.`</p>`  
        `</body>`   
    `</html>`  
</pre></code>
