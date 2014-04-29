# -*- coding: utf-8 -*-
require 'kramdown'

class Kramdown::Converter::HtmlCustom < Kramdown::Converter::Html
  def convert_a(el, indent)
    res = inner(el, indent)
    attr = el.attr.dup
    if attr['href'].empty?
      attr['href'] = @options[:wiki].search_file(res)
    end
    if attr['href'].start_with?('/')
      attr['href'] = @options[:baseurl] + attr['href']
    end
    format_as_span_html(el.type, attr, res)
  end
end
