<template>
  <div class="home">
    <div v-if="!started">
      <h1>Perform Live Speech to Text Conversion</h1>
      <div>
          <label>Cognitive Services Speech API Key</label>
          <input type="password" v-model="key" placeholder="Cognitive Services Speech API Key" /></div>
      <div>
        <select v-model="fromLanguage">
          <option v-for="lang in fromLanguages" :value="lang" :key="lang">
            {{ lang }}
          </option>
        </select>
        <button @click="start">start</button>
      </div>
    </div>
    <div v-else>
      <button @click="stop">stop</button>
      <div id="currentSentence" class="caption">
        {{ currentSentence }}
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import constants from '../lib/constants'
import SpeechServices from '../lib/speechServices'
import languageListMixin from '../lib/language-list-mixin'

const speechApiKeyLocalStorageKey = 'speechApiKey'

export default {
  mixins: [ languageListMixin ],
  data() {
    return {
      key: window.localStorage.getItem(speechApiKeyLocalStorageKey) || '',
      region: `${constants.region}`,
      currentSentence: '',
      started: false,
      fromLanguage: 'en-US'
    }
  },
  watch: {
    key(newKey) {
      window.localStorage.setItem(speechApiKeyLocalStorageKey, newKey)
    }
  },
  created() {
    this.speechToText = new SpeechServices(function(captions) {
      this.currentSentence = captions.original
    }.bind(this))
  },
  methods: {
    start() {
      this.speechToText.start({
        key: this.key,
        region: this.region,
        fromLanguage: this.fromLanguage,
        toLanguages: this.toLanguages
      })
      this.started = true
    },
    stop() {
      this.started = false
      this.currentSentence = ''
      this.speechToText.stop()
    }
  },
  beforeDestroy() {
    this.speechToText.stop()
  }
}
</script>

<style scoped>
input[type=password] {
  width: 600px;
}
</style>