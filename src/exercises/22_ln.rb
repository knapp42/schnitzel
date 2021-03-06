# ln
@exercises << Exercise.new(
    'Nur die Harten kommen in den Garten',
    'Machen Sie sich mit der Funktionsweise von Hard- und Softlinks und dem Kommando "ln" vertraut.',
    %Q{
      Im Ordner `#{PROJEKT_PATH}` finden Sie eine Datei namens `highlander.txt`. Erstellen Sie einen _Hardlink_ namens `fasil.txt` auf diese Datei.

      Öffnen Sie nun `fasil.txt` in einem Texteditor und ändern Sie den Inhalt zu `"Es kann nur zwei geben!"` und speichern Sie den Inhalt. Sehen Sie sich danach die Datei `highlander.txt` an.
    },
    :enter,
    'ln highlander.txt fasil.txt',
    -> (os) do
      f = "#{PATH}/fasil.txt"
      File.exists?(f) && File.read(f).strip == "Es kann nur zwei geben!" && \
      if os == :linux
        `stat -c %h #{f}`.strip == "2"
      elsif os == :macos
        `stat -f %l #{f}`.strip == "2"
      end
    end,
    -> () { f = "#{PATH}/highlander.txt"; File.write(f, "Es kann nur einen geben!\n\n") unless File.exists?(f) }
)
