<h2>Edit this event</h2>
<%= form_with model: @event do |form| %>
  <%= form.label :title, "Title" %>
  <%= form.text_field :title %> <br>
  <%= form.label :description, "Description" %>
  <%= form.text_area :description%><br>
  <%= form.label :location, "Location" %>
  <%= form.text_field :location %><br>
  <%= form.label :location, "Date" %>
  <%= form.date_field :date %><br>
  <%= form.submit %>
<% end %>