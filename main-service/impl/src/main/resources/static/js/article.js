import {sendAuthenticatedRequest, sendWithTokensIfExist} from "./auth.js";

let articleId = window.location.pathname.split('/')[2];
let article_response = sendWithTokensIfExist('/api/v1/articles/' + articleId, {method: 'GET'})

article_response = article_response.then(res => {
   if (res.status === 200) {
      return res.json();
   }
   return Promise.reject(res);
}).then(res => {
   document.title = res.title;
   $('#article-author-mini-img').attr('src', res.author.profileImage);
   $('#article-author-username').html(res.author.username);
   $('#article-title').html(res.title);
   $('#article-views').html(res.views);
   $('#article-cover').attr("src", res.cover);
   $('#user-link').attr("href", "/users/" + res.author.id);
   $('#article-publication-date').html('Дата публикации: ' + res.publicationDate)
   res.tags.forEach(tag => {
      $('#article-tags').append('<span class="tag-style">' + tag.name + '</span>');
   })
   $('#article-content').html(res.content);
   $('#rating').html(res.rating);
   return Promise.resolve(true);
}).catch((reason) => {
   if (reason.status === 404) {
      window.location.replace('/404')
   } else {
      alert('An error has occurred. Status: ' + reason.status);
      window.location.replace('/');
   }
   return Promise.reject(false);
})


$(document).ready(function (){
   article_response.then(res => {
      if (res === true) {
         let check_auth_request = sendAuthenticatedRequest('/api/v1/auth/check', {method: 'GET'})
         let authenticated = check_auth_request.then(res => {
            return res.status === 200;
         })

         authenticated.then(res => {
            if (res === true) {
               let article_id = window.location.pathname.split('/')[2];
               let response_rating = sendAuthenticatedRequest('/api/v1/ratings/articles/' + article_id + '/me', {method: 'GET'})
               response_rating.then(res => {
                  if (res.status === 200) {
                     return res.text();
                  }
                  return res.json().then(error => Promise.reject(error));
               }).then(res => {
                  if (res > 0) {
                     $('#plus-btn').prop('disabled', true);
                     $('#minus-btn').prop('disabled', false);
                     $('#plus-btn').addClass('btn-success');
                  } else if (res < 0) {
                     $('#minus-btn').prop('disabled', true);
                     $('#plus-btn').prop('disabled', false);
                     $('#minus-btn').addClass('btn-success');
                  }

                  $('#plus-btn').on('click', function () {
                     let response_plus_rating = sendAuthenticatedRequest('/api/v1/ratings/articles/' + article_id + '/plus', {method: 'POST'});
                     response_plus_rating.then(res => {
                        if (res.status === 200) {
                           return res.text();
                        }
                        return res.json().then(error => Promise.reject(error));
                     }).then(res => {
                        $('#plus-btn').prop('disabled', true);
                        $('#minus-btn').prop('disabled', false);
                        $('#plus-btn').addClass('btn-success');
                        $('#minus-btn').removeClass('btn-success');
                        $('#rating').html(res);
                     }).catch(reason => {alert(JSON.stringify(reason))})
                  })
                  $('#minus-btn').on('click', function () {
                     let response_minus_rating = sendAuthenticatedRequest('/api/v1/ratings/articles/' + article_id + '/minus', {method: 'POST'});
                     response_minus_rating.then(res => {
                        if (res.status === 200) {
                           return res.text();
                        }
                        return res.json().then(error => Promise.reject(error));
                     }).then(res => {
                        $('#minus-btn').prop('disabled', true);
                        $('#plus-btn').prop('disabled', false);
                        $('#minus-btn').addClass('btn-success');
                        $('#plus-btn').removeClass('btn-success');
                        $('#rating').html(res);
                     }).catch(reason => {alert(JSON.stringify(reason))})
                  })
               }).catch(reason => {
                  alert(JSON.stringify(reason));
               })

            } else {
               $('#plus-btn').prop('disabled', false);
               $('#minus-btn').prop('disabled', false);
            }
         })
      }
   })
})