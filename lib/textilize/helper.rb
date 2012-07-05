#mainly extract from Rails2.
module Textilize
  module Helper
    require 'RedCloth'
    # Returns the text with all the Textile[http://www.textism.com/tools/textile] codes turned into HTML tags.
    #
    # You can learn more about Textile's syntax at its website[http://www.textism.com/tools/textile].
    # <i>This method is only available if RedCloth[http://whytheluckystiff.net/ruby/redcloth/]
    # is available</i>.
    #
    # ==== Examples
    #   textilize("*This is Textile!*  Rejoice!")
    #   # => "<p><strong>This is Textile!</strong>  Rejoice!</p>"
    #
    #   textilize("I _love_ ROR(Ruby on Rails)!")
    #   # => "<p>I <em>love</em> <acronym title="Ruby on Rails">ROR</acronym>!</p>"
    #
    #   textilize("h2. Textile makes markup -easy- simple!")
    #   # => "<h2>Textile makes markup <del>easy</del> simple!</h2>"
    #
    #   textilize("Visit the Rails website "here":http://www.rubyonrails.org/.)
    #   # => "<p>Visit the Rails website <a href="http://www.rubyonrails.org/">here</a>.</p>"
    #
    #   textilize("This is worded <strong>strongly</strong>")
    #   # => "<p>This is worded <strong>strongly</strong></p>"
    #
    #   textilize("This is worded <strong>strongly</strong>", :filter_html)
    #   # => "<p>This is worded &lt;strong&gt;strongly&lt;/strong&gt;</p>"
    def textilize(text, *options)
      text = sanitize(text) unless text.html_safe?
      text.blank? ? "" : RedCloth.new(text, options).to_html.html_safe
    end

    # Returns the text with all the Textile codes turned into HTML tags,
    # but without the bounding <p> tag that RedCloth adds.
    #
    # You can learn more about Textile's syntax at its website[http://www.textism.com/tools/textile].
    # <i>This method is requires RedCloth[http://whytheluckystiff.net/ruby/redcloth/]
    # to be available</i>.
    #
    # ==== Examples
    #   textilize_without_paragraph("*This is Textile!*  Rejoice!")
    #   # => "<strong>This is Textile!</strong>  Rejoice!"
    #
    #   textilize_without_paragraph("I _love_ ROR(Ruby on Rails)!")
    #   # => "I <em>love</em> <acronym title="Ruby on Rails">ROR</acronym>!"
    #
    #   textilize_without_paragraph("h2. Textile makes markup -easy- simple!")
    #   # => "<h2>Textile makes markup <del>easy</del> simple!</h2>"
    #
    #   textilize_without_paragraph("Visit the Rails website "here":http://www.rubyonrails.org/.)
    #   # => "Visit the Rails website <a href="http://www.rubyonrails.org/">here</a>."
    def textilize_without_paragraph(text, *options)
      textiled = textilize(text, *options)
      if textiled[0..2] == "<p>" 
        textiled = textiled[3..-1] 
      end
      if textiled[-4..-1] == "</p>"
        textiled = textiled[0..-5] 
      end
      textiled.html_safe
    end
    
  end
end

