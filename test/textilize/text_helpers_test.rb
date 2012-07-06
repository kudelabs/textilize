require 'test_helper'

class TextHelpersTest < ActionView::TestCase
  tests Textilize::Helper

  test "textilize should be htmlsafe" do
    assert textilize("*Rails Rock!*!").html_safe?
  end

  test "textilize" do
    assert_equal(%(<p>I <em>love</em> <acronym title="Ruby on Rails">ROR</acronym>!</p>), textilize("I _love_ ROR(Ruby on Rails)!"))
  end

  test "textilize with blank" do
    assert_equal("", textilize(""))
  end

  test "textilize with options" do
    assert_equal("<p>This is worded <strong>strongly</strong></p>", textilize("This is worded <strong>strongly</strong>", :filter_html))
  end
  
  test "textilize without paragraph should be htmlsafe" do 
    textilize_without_paragraph("*Rails Rocks!*!").html_safe?
  end
  
  test "textilize without paragraph" do
    assert_equal(%(I <em>love</em> <acronym title="Ruby on Rails">ROR</acronym>!), textilize_without_paragraph("I _love_ ROR(Ruby on Rails)!"))
  end
  
  test "textilize without paragraph with blank" do
    assert_equal("", textilize_without_paragraph(""))
  end
  
  test "textilize without paragraph with options" do
    assert_equal("This is worded <strong>strongly</strong>", textilize_without_paragraph("This is worded <strong>strongly</strong>", :filter_html))
  end
  

end
