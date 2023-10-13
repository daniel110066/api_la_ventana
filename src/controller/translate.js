import { Translate } from '@google-cloud/translate/build/src/v2/index.js';

// Crea una instancia del cliente de Google Cloud Translation
const translate = new Translate();

// Función asincrónica para traducir un texto
async function translateText(textToTranslate, targetLanguage) {
  try {
    const [translation] = await translate.translate(textToTranslate, targetLanguage);
    return translation;
  } catch (error) {
    console.error('Error al traducir:', error);
    throw error;
  }
}

