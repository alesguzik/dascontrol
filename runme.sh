#!/bin/sh

# [x] Recorder
# [x] Recognizer
# [ ] Matcher
# [x] Executor

# Recorder
python recorder.py sample.flac

# Recognizer
curl --data-binary @sample.flac -k --header "Content-type: audio/x-flac; rate=16000" "https://www.google.com/speech-api/v1/recognize?lang=ru-RU&client=chromium" | tee /dev/tty|jshon -e hypotheses -e 0 -e utterance -u > sample.txt

# [ ] Matcher
cp sample.txt action.txt

# [x] Executor
python executor.py action.txt
