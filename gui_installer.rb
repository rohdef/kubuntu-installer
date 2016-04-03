#!/usr/bin/ruby

require "rndk"

begin
  title = "rohdef's Kubuntu installer"

  screen = RNDK::Screen.new()
  RNDK::Color.init()
  RNDK::blink_cursor(false)

  config = {
    :x => RNDK::CENTER,
    :y => RNDK::TOP,
    :text => "</76>#{title}",
    :shadow => true
  }
  label = RNDK::Label.new(screen, config)

  screen.refresh()

  items = ["bleh", "blah", "bluh"]
  scrollConfig = {
    :x => RNDK::LEFT,
    :y => 5,
    :width => RNDK::Screen.width/2-1,
    :height => RNDK::Screen.height-5,
    :title => "Items",
    :items => items,
    :numbers => true,
    :highlight => RNDK::Color[:cyan]
  }
  scroll = RNDK::Scroll.new(screen, scrollConfig)
  screen.refresh()

  items2 = ["Fi", "Fy", "Fo"]
  scroll2Config = {
    :x => RNDK::RIGHT,
    :y => 5,
    :width => RNDK::Screen.width/2-1,
    :height => RNDK::Screen.height-5,
    :title => "Details",
    :items => items2,
    :numbers => true,
    :highlight => RNDK::Color[:cyan]
  }
  scroll2 = RNDK::Scroll.new(screen, scroll2Config)
  screen.refresh()

  loop do
    scroll.activate()

    if scroll.exit_type == :NORMAL
      index = scroll.current_item
      screen.popup_label "Hey there"
    elsif scroll.exit_type == :ESCAPE_HIT
      RNDK::Screen.finish()
      exit
    end
  end

rescue Exception => e
  RNDK::Screen.finish()
end
