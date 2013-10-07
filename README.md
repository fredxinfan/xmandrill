xmandrill
=========

- A simple API wrapper for Mandrill
=================================

# Get started

- gem install xmandrill
======================

# Examples
- Make a simple API call. 
``@xm = Xmandrill::API.new("valid-api-key")
@xm.users_info
``

- Send email with customized Mustache template.
If you have the following code in ``template.html``
``
`<html>`
`<body>`
Hi {{name}}

Please download your order `<a href="{{link}}">`here`</a>`.

{{#shipping}}
	You'll also receive a hard copy to {{address}}.
{{/shipping}}
`</body>`
`</html>`
``

``@html = @xm.html('path/to/template.html', name: "Fred", link: "http://example.com/orders", shipping: true, address: "Number Street, Suburb Postcode")``

It will return:
``
`<html>`
`<body>`
Hi Fred

Please download your order `<a href="http://example.com/orders">`here`</a>`.

You'll also receive a hard copy to Number Street, Suburb Postcode.
`</body>`
`</html>`
``

Then pass the template to your API call.
``
@xm.messages_send({
message: {
html: @html,
text: "Example text content",
subject: "example subject",
from_email: "message.from_email@example.com",
from_name: "Example Name",
to: [
{
email: "recipient.email@example.com",
name: "Recipient Name"
}
],
headers: {
"Reply-To": "message.reply@example.com"
},
important: false,
track_opens: null,
track_clicks: null,
auto_text: null,
auto_html: null,
inline_css: null,
url_strip_qs: null,
preserve_recipients: null,
view_content_link: null,
bcc_address: "message.bcc_address@example.com",
tracking_domain: null,
signing_domain: null,
return_path_domain: null,
merge: true,
global_merge_vars: [
{
"name": "merge1",
"content": "merge1 content"
}
],
merge_vars: [
{
"rcpt": "recipient.email@example.com",
"vars": [
{
"name": "merge2",
"content": "merge2 content"
}
]
}
],
tags: [
"password-resets"
],
subaccount: "customer-123",
google_analytics_domains: [
"example.com"
],
google_analytics_campaign: "message.from_email@example.com",
metadata: {
"website": "www.example.com"
},
recipient_metadata: [
{
"rcpt": "recipient.email@example.com",
"values": {
"user_id": 123456
}
}
],
attachments: [
{
"type": "text/plain",
"name": "myfile.txt",
"content": "ZXhhbXBsZSBmaWxl"
}
],
images: [
{
"type": "image/png",
"name": "IMAGECID",
"content": "ZXhhbXBsZSBmaWxl"
}
]
},
async: false,
ip_pool: "Main Pool",
send_at: "example send_at"
})
``
