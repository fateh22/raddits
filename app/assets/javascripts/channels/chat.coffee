App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
      	 $('#messages').append data['message']
        #alert data['message']


  speak: (messages) ->
      @perform 'speak',message: messages



jQuery(document).ready ->
  jQuery(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode == 13
      #alert  jQuery(this).val()
      current_id =  jQuery("#current_user").val() 
      freind_id = jQuery(".single_chat_friend.active").attr 'data-freind-id'
      mymessage = jQuery(this).val()
      data={
      "friend_id":freind_id,
      "user_id":current_id,
      "content":mymessage,
      }
      App.chat.speak data
      jQuery(this).val("")
      event.preventDefault()
      return
	return


 
