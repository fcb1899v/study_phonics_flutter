/// Study Phonics App - Text-to-Speech Manager
/// 
/// This class manages text-to-speech functionality for the phonics learning app.
/// It handles voice selection, speech synthesis, and platform-specific configurations.
/// 
/// Features:
/// - Multi-language TTS support
/// - Platform-specific voice selection (iOS/Android)
/// - Audio session management
/// - Speech rate and volume control
/// 
/// Author: Nakajima Masao
/// Version: 1.5.3

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'extension.dart';

/// Text-to-Speech Manager
/// Handles all TTS operations including voice selection, speech synthesis,
/// and platform-specific configurations for iOS and Android.
class TtsManager {
  final BuildContext context;
  TtsManager({required this.context});

  /// FlutterTts instance for speech synthesis
  final FlutterTts flutterTts = FlutterTts();

  // =============================================================================
  // VOICE CONFIGURATION
  // =============================================================================

  /// Default TTS locale for English (US)
  static const String ttsLocale = "en-US";
  /// Android voice name for English language
  static const String androidVoiceName = "en-US-language";
    /// iOS voice name (Samantha is a high-quality English voice)
  static const String iOSVoiceName = "Samantha";
  /// Platform-specific default voice name
  String defaultVoiceName = (Platform.isIOS || Platform.isMacOS) ? iOSVoiceName: androidVoiceName;

  /// Sets the TTS voice based on platform and available voices
  /// This method:
  /// 1. Gets all available voices on the device
  /// 2. Filters for local female voices (iOS/macOS only)
  /// 3. Selects the best available voice or falls back to default
  /// 4. Configures the voice with appropriate locale
  Future<void> setTtsVoice() async {
    // Get all available voices on the device
    final voices = await flutterTts.getVoices;
    // Filter for local female voices (iOS/macOS only)
    List<dynamic> localFemaleVoices = (Platform.isIOS || Platform.isMacOS) ? voices.where((voice) {
      final isLocalMatch = voice['locale'].toString().contains(context.lang());
      final isFemale = voice['gender'].toString().contains('female');
      return isLocalMatch && isFemale;
    }).toList(): [];
    "localFemaleVoices: $localFemaleVoices".debugPrint();
    
    if (context.mounted) {
      // Check if default voice exists or if no local voices are available
      final isExistDefaultVoice = localFemaleVoices.any((voice) => voice['name'] == defaultVoiceName) || localFemaleVoices.isEmpty;
      // Select voice name and locale
      final voiceName = isExistDefaultVoice ? defaultVoiceName: localFemaleVoices[0]['name'];
      final voiceLocale = isExistDefaultVoice ? ttsLocale: localFemaleVoices[0]['locale'];      
      // Set the voice configuration
      final result = await flutterTts.setVoice({'name': voiceName, 'locale': voiceLocale,});
      "setVoice: $voiceName, setLocale: $voiceLocale, result: $result".debugPrint();
    }
  }

  /// Speaks the provided text using TTS
  /// Stops any current speech before starting new speech to prevent overlap
  /// [text] - The text to be spoken
  Future<void> speakText(String text) async {
    await flutterTts.stop(); // Stop any current speech
    await flutterTts.speak(text); // Start speaking the new text
    text.debugPrint(); // Log the spoken text
  }

  /// Stops the current TTS speech
  /// Useful for interrupting speech when user navigates away or starts new speech
  Future<void> stopTts() async {
    await flutterTts.stop();
    "Stop TTS".debugPrint();
  }

  /// Initializes TTS with platform-specific configurations
  /// This method sets up:
  /// - Shared instance for better performance
  /// - iOS audio session configuration
  /// - Speech completion handling
  /// - Language and voice settings
  /// - Volume and speech rate
  Future<void> initTts() async {
    // Enable shared instance for better performance
    await flutterTts.setSharedInstance(true);
    // iOS-specific audio session configuration
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterTts.setIosAudioCategory(
        IosTextToSpeechAudioCategory.playback,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
          IosTextToSpeechAudioCategoryOptions.defaultToSpeaker
        ]
      );
    }
    // Configure speech completion handling
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.awaitSynthCompletion(true);
    // Set language and check availability
    if (context.mounted) await flutterTts.setLanguage(context.lang());
    if (context.mounted) await flutterTts.isLanguageAvailable(context.lang());
    // Set voice and speech parameters
    if (context.mounted) await setTtsVoice();
    await flutterTts.setVolume(1); // Maximum volume
    await flutterTts.setSpeechRate(0.5); // Moderate speech rate for clarity
  }
} 