Builds on top of Rails serialize method to create accessors for your serialized fields.
Please read this post as <a href="http://gregmoreno.ca/preventing-model-explosion-via-rails-serialization/">I explain my motivation</a> behind this.

Basically, it lets you do the following in your ActiveRecord models.

{% highlight ruby %}

class User
  serializeable :preferences, { :show_email => false }
end

u = User.new :show_email => true
u.show_email
=> true

u = User.new
u.show_email
=> false
u.show_email = true
=> true

u = User.new :show_email => true
u.save

u = User.find(u)
u.show_email
=> true

{% endhighlight %}
