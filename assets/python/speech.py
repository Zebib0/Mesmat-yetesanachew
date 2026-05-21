from flask import Flask, request, jsonify
from flask_cors import CORS
import os
import torchaudio
from speechbrain.inference import EncoderDecoderASR

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# Load the pretrained ASR model once
asr_model = EncoderDecoderASR.from_hparams(source="speechbrain/asr-wav2vec2-dvoice-amharic", savedir="models/asr_model")

@app.route('/recognize', methods=['POST', 'GET'])
def recognize():
    if 'audio' not in request.files:
        return jsonify({'error': 'No audio file provided'}), 400

    audio_file = request.files['audio']
    audio_path = 'temp_audio.wav'
    audio_file.save(audio_path)

    transcription = transcribe_audio(audio_path)

    os.remove(audio_path)  # Clean up the temporary file
    return jsonify({'transcript': transcription})

def transcribe_audio(audio_path):
    signal, sample_rate = torchaudio.load(audio_path)
    transcription = asr_model.transcribe_batch(signal)
    return transcription

if __name__ == '__main__':
    app.run(debug=True, host='127.0.0.1')
