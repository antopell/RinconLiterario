// Fetch the template content using AJAX (assuming you have a Rails route for this)
fetch('/create_rating', {
    method: 'GET',
    headers: {
      'Accept': 'text/html'
    }
  })
  .then(response => response.text()) // Parse the response as text
  .then(htmlContent => {
    // Update the modal content with the fetched HTML
    // $('#createRatingModal').html("<%= j (render partial: 'review/create_rating) %>");
  
    // Show the modal
    $('#createRatingModal').modal('show');
  })
  .catch(error => {
    console.error('Error fetching modal content:', error);
    // Handle potential errors gracefully (e.g., display an error message)
  });
  