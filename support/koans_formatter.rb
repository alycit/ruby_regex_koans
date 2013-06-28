require "rspec/core/formatters/base_formatter"

class KoansFormatter < RSpec::Core::Formatters::BaseFormatter

  def initialize(output)
    super(output)
    @passed_count = 0
    @observations = []
  end

  def example_passed(example)
    @passed_count += 1
    @observations << green("Mission Accomplished!\n  #{example.example_group.description} -> #{example.description}\n\n")
  end

  def example_failed(example)
    unless failed?
      @failure = example.exception
      @observations << red("Here's your next assignment:\n  #{example.example_group.description} -> #{example.description}")
    end
    exit
  end

  def format_backtrace(backtrace, example)
    super(backtrace, example.metadata)
  end

  def start_dump
    if failed?
      @observations.each { |c| puts c }
      guide_through_error
      show_progress
    else
      end_screen
    end
  end

  def failed?
    !@failure.nil?
  end

  def assert_failed?
    @failure.is_a?(RSpec::Expectations::ExpectationNotMetError)
  end

  def guide_through_error
    ##change this up
    puts
    puts "The current error:"
    puts red(@failure.message)
    puts
    puts "Get in there soldier! There's code to fix:"
    if assert_failed?
      puts embolden_first_line_only(indent(find_interesting_lines(@failure.backtrace)))
    else
      puts embolden_first_line_only(indent(@failure.backtrace))
    end
    puts
  end

  def show_progress
    bar_width = 50
    scale = bar_width.to_f/@example_count
    print green("Current Progress: [")
    happy_steps = (@passed_count*scale).to_i
    happy_steps = 1 if happy_steps == 0 && @passed_count > 0
    print green('.'*happy_steps)
    if failed?
      print red('X')
      print cyan('_'*(bar_width-1-happy_steps))
    end
    print green(']')
    print " #{@passed_count}/#{@example_count}"
    puts
  end

  def embolden_first_line_only(text)
    first_line = true
    text.collect { |t|
      if first_line
        first_line = false
        red(t)
      else
        cyan(t)
      end
    }
  end

  def indent(text)
    text = text.split(/\n/) if text.is_a?(String)
    text.collect { |t| "  #{t}" }
  end

  def find_interesting_lines(backtrace)
    backtrace.reject { |line|
      line =~ /rspec-expectations|rspec-core|bin/
    }
  end

  def end_screen
    "JRuby 1.9.x Koans"
    ruby_version = "(in #{'J' if defined?(JRUBY_VERSION)}Ruby #{defined?(JRUBY_VERSION) ? JRUBY_VERSION : RUBY_VERSION})"
    ruby_version = ruby_version.side_padding(54)
    completed = <<-ENDTEXT
                            ...  ,;:    :;;   ;:`
                            ;;;  ,;;    ,;;   ;;`     ;;;`
                    .;;:    ;;;  .;;    .;;   ;;      ;;;   ;;,
                   ;;;;;    :;;  `;;    `;; ;;;;      ;;;   ;;;
               ;   :;;;;    `;;`  ;;     ;; ;;;;      ;;;   ;;;     ;;
             `;;;   ;;;;     ;;.  ;;     ;;  ;;;     `;;;   ;;,     ;;;:
            ;;;;;`   ;;;    ,;;:  ;;     :;   ;      `;;.  `;;     .;;;
          ,;;;;;;:   .;;    `;;;  :;:    ;;   ;`      ;;   ,;;     ;;;;  `;;
         ;;;;;;;;;   ,;;`    ;;;  .;;    ;;  .;.     `;;   ;;.    `;;;,  ;;;;
        ;;;;    ;;;   ;;;     ;;::`;`    ;;  `;.     ,;,  `;;     ;;;;  .;;;;;
       ;;;;;.   ,;;.  ,;;     ;;;;.;     ,;   ;      .;   ;;;     ;;;,  ;;;;;`
        .;;;;,   .;;   .;     `` ;;;      .   ,      ,;   :;      ;;;  .;;;.
          ;;;;;   `;              ..                 :,   ;;      ;;`  ;;;,
     `      ;;;;`                                    `   ,;`     :;;   ;;;
     ;;:      :;;                                        ;;      ;;    ;;    ;:
     ;;;;;`                                                      ;;   ;;:   .;;`
    :;;;;;;;                `,,::::.    ::::::::  :::`  :::`    .;   :;;    ;;;
     :: ;;;;;.              `;;;;;;;;   ;;;;;;;;  ;;;,  ;;;      ,   ;;,    ;;;;;`
         .::::.             `;;;;;;;;;  ;;;;;;;;  ;;;; .;;;          ;;    :;;;;;;;;;.      .
                            `;;;  :;;;  ;;;:....  ;;;; ,;;;          ;,    ;;;,;;;;;;;;;`  ,;;;;:.
   ,::,,.`                  `;;;  ,;;;  ;;;:      ,;;; :;;;                ;;;   .;;;;;;;; ;;;;;;;;;;`        ;:
   ;;;;;;;;;;,              `;;;  `;;;  ;;;:      `;;; :;;:               ;;;.      .;;;;; ;;;;;;;;;;;;,     `;;;;
   ;;;;;;;;;;:              `;;;   ;;;` ;;;:       ;;; ;;;`               ;;;;;:`       `,:;;;;;;;;;;;;;;,   .;;;;  `
   ;;;;;;;;                 `;;;   ;;;. ;;;;;;;:   ;;; ;;;               `;;;;;;;;;;.     ;;;;;;;;;;;;;;;;;  ;;;;,  ;;;
   ;;;;.`.    ``            `;;;   ;;;. ;;;;;;;:   ;;; ;;;               :;;;:;;;;;;;;:  `;;;;;  `:;;;;;;;;  ;;;;  .;;;;;
   ;;     ,;;;;;            `;;;   ;;;. ;;;;;;;:   ;;; ;;;               ;;;    `;;;;;;; ;;;;;:     ,;;;;;;  ;;:   ;;;;;
       .;;;;;;;`            `;;;   ;;;` ;;;:       ;;;;;;;               ;;;;;`    `;;;; ;;;;;       ;;;;;; :;;    ;;;;.
     :;;;;;;:`  `,          `;;;   ;;;  ;;;:       .;;;;;:              `;;;;;;;:    ;;;`;;;;;      `;;;;;  ;;;    ;;;:     .
    ;;;;;;,    ;;:          `;;;  .;;;  ;;;:       `;;;;;`                .;;;;;;;;;;;;`;;;;;       :;;;;; `;;:  :;;,      ,;:
    .;;;;`    ;;;           `;;;;`;;;;  ;;;;,,,:`   ;;;;;               ;;;, .;;;;;;;;; ;;;;;       ;;;;;: ;;;   ;;;      `;;;:
     ;;.    ,;;;    `:      `;;;;;;;;;  ;;;;;;;;.   ;;;;;              .;;;;;;;``;;;;;;,;;;;,        ,;;;` ;;;  .;;;      ;;;;;.
           ;;;,     ;;   `` `;;;;;;;;   ;;;;;;;;.   ;;;;;              ;;;;;;;;;;;` .; ;;;;;   ,;;         ;;   ;;;      ;;;;;;,
         `;;;;     ;;.  ;;  `,,,,,.`    ,,,,,,,,`   ,,,,,              ;;,.,;;;;;;;;;` ;;;;;   ;;;   ;`        ,;;      :;;;;;:
        `;;;;`    ;;;  ,;;                                     :      ,;;`     :;;;;;;,;;;;:  ;;;;  .;;.               ;;;;;;   `,
        ;;;;:    ;;;   ;;.    ;;  :;                          `;      ;;;;;;`    ;;;; ;;;;;  `;;;;  ;;;. ,;;          ;;;;    ,;;;
        ;;;,    ,;;;   ;;    ,;; `;;                          .;      ,;;;;;;;;`  ;;; ;;;;;  ;;;;:  ;;;. ;;: ;;;;    ;;;,   `;;;;;`
         `;     ;;;: ;;;;    ;;` :;;     ;   ,      ,`  ;     ,;,       `;;;;;;;;;;;,;;;;;; ;;;;;, .;;;.;;;. ;;;;;;  ;;   ;;;;;;;;:
               ;;;,,`;;;,   ,;;  ;;,    .;   ;      ;,  ;;    :;;    ,;;;: .;;;;;;;; ;;;;;` ;;;;;. ;;;;;;;; :;;`;;;    .;;;;;;;;;;;
              `;;; .;;;;    ;;;  ;;     ;;  .;      ;;  ;;.   :;;  ;;;;;;;;.   :;;;;`;;;;; ;;;;;;` ;;;;;;;; ;;` ;;:  `;;;;;;;;;;;;;
               ;;  .;;;;   ,;;`  ;;    `;;  :;     `;;  ;;;   :;;  ;;;;;;;;;;;;;:   ;;;;;; ;;;;;; .;;;;;;;,`;;`;;;    ,;;;;;,;;;;;;
                , ;;;;;    ;;;  .;;    ;;:  ;;     :;;  ;;;   :;;   ;;;  :;;;;;;;;: ;;;;;.`;; .;; ;;;;;;;; ;;;;;;;         :`
                 `;;;;;   .;;,  ;;;    ;;,  ;;     ;;;  ;;;   :;;   ;;;:  ;;;:;;;;;`;;;;;     `;; ;;;;;;;; ;;;;;;:
                 .;;;;    ;;;  .;;;   `;;`  ;;     ;;;  ;;;.  ,;;   :;;;;;;;;   ;;`;;;;;;      `` ;; ;;;;, ;;.:;;  ,;;;;;;;;`,;;;;,
                  ;;.     ;;;  ;;;:   ;;;  `;;     ;;;  ;;;;  ,;;   ;;;;;;;;;:.,;; ;;;;;:             ;;; ,;;      ;;,;;;;;;;;;;;;;
                         :;;`  ;;;:   ;;;  :;;     ;;;  :;;;  ,;;      .;;;;;;;;;;,;;;;;       .`      ,; :;;      ;:  ;;;;;;;;;;;;
                         :;;  `;;;.   ;;;  ;;;     ;;;  .;;;` ,;;`         ,;;;;;`;;;;;;       ;;;:`      ,,       ,;: ,,:;;;;;;;;;
                           `  ,;;;   `;;;  ;;;     ;;;  `;;;, ,;;.            ,;; ;;;;;:      `;;;;: ,;;   .     :..;;;     ;;;;;;;
                              :;;;   ,;;;  ;;;     ;;;   ;;;:                    .;;;;;;;     :;;;;, ;;;   ;:    ;; ;;;;;;   ,;;;;
                                 .   ;;;,  ;;;     ;;;   :.`                     `;;;;;;;;;;,.;;;;;  ;;;  ,;;    ;;; ;;;;,     ;;.
                                      `;`  :;;     ;:                             ;;;;;;;;;;;;;;;;;  ;;;  ;;;    ;;;  ;;;;;;
                                                                                   ,;;;;;;;;;;;;;;; ,;;.  ;;;    ;;;`  ;;;;;;
                                                                                      .;;;;;;;;;;;` ;;;   ;;;    ;;;;  :;;;;;;`
                                                                                         .;;;;;;;;  ;;`    ;;    ;;;;` `;;;;;;`
                                                                                            `:;;;  `;;;   `;;    ;;;;;  ;;;;;;
                                                                                                   ,;;;   ;;;    ;;;;;:  ;;;;
                                                                                                   ;;;;  .;;;`   ;;;;;;   ;;
                                                                                                   ;;;`  ,;;;:   `;;;;;    .
                                                                                                   ;;;   :;;;;    ;;;;;`
                                                                                                    ::   ;;;;;    `;`
                                                                                                         `.:;
          
          Congratulations!  You are on your way to be coming a Regex Wizard.

          Ported to Ruby / RSpec by Alyssa Diaz (@alycit) & Chris Vaughn (@mistercvaughn) for Dev Bootcamp

          Original JavaScript version by Aaron Brown https://github.com/frenchroasted/RegexKoans

          Thanks to NeoEdgeContext (aka, Neo, aka New Context, aka Edgecase) http://www.neo.com 
          for the original inspiration from their Ruby Koans http://www.rubykoans.com

      ENDTEXT
    puts magenta(completed)
  end

  protected

  def color(text, color_code)
    color_enabled? ? "#{color_code}#{text}\e[0m" : text
  end

  def red(text)
    color(text, "\e[31m")
  end

  def green(text)
    color(text, "\e[32m")
  end

  def cyan(text)
    color(text, "\e[36m")
  end

  def blue(text)
    color(text, "\e[34m")
  end

  def magenta(text)
    color(text, "\e[35m")
  end

end

class String
  def side_padding(width)
    extra = width - self.size
    if width < 0
      self
    else
      left_padding = extra / 2
      right_padding = (extra+1)/2
      (" " * left_padding) + self + (" " *right_padding)
    end
  end
end


