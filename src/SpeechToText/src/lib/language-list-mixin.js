import axios from 'axios'
import constants from './constants'

export default {
  data() {
    return {
      fromLanguages: [],
      toLanguages: []
    }
  },
  methods: {
    async getLanguages() {
      const languages = [
          'en-US',
          'fr-FR',
          'es-ES',
          'ko-KO',
          'ja-JP',
          'de-DE'
        ]
      return {
        from: languages,
        to: languages
      }
    }
  },
  async mounted() {
    const languages = await this.getLanguages()
    this.fromLanguages = languages.from
    this.toLanguages = languages.to
  }
}