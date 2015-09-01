# -------------------------------
# Simba Leap motion controller
#
# Description: A Leap motion controller for soopro theme
# http://www.soopro.com
#
# Author:   redy
# Date:     7 July 2015
# -------------------------------  

$(document).ready ->
  controller = Leap.loop
    enableGestures: true
  , (frame) ->
    # if frame.hands.length > 0
    #   hand = frame.hands[0]
    #   console.log hand.direction
    if frame.valid and frame.gestures.length > 0
      frame.gestures.forEach (gesture) ->
        switch gesture.type
          when 'circle'
            console.log 'Circle Gesture'
            break
          when 'keyTap'
            console.log 'Key Tap Gesture'
            break
          when 'screenTap'
            console.log 'Screen Tap Gesture'
            break
          when 'swipe'
            gesture_d0 = Math.abs(gesture.direction[0])
            gesture_d1 = Math.abs(gesture.direction[1])
            isHorizontal =  gesture_d0 > gesture_d1
            #Classify as right-left or up-down
            if isHorizontal
              if gesture.direction[0] > 0
                swipeDirection = 'right'
              else
                swipeDirection = 'left'
            else
              #vertical
              if gesture.direction[1] > 0
                swipeDirection = 'up'
              else
                swipeDirection = 'down'
            console.log 'Swipe Gesture', swipeDirection
            break
        return
    return
  