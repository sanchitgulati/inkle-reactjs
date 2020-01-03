import React, { Component } from 'react';
import {
  Box,
  Grommet,
  ResponsiveContext,
} from 'grommet';

import { Story } from "inkjs";
import axios from 'axios';
import AppBar from './components/AppBar'
import OptionsMenu from './components/OptionsMenu'
import theme from './themes/default'
import ConversationBox from './components/ConversationBox';


class App extends Component {

  componentDidMount() {
    this.loadStory(this.state.url);
  }

  constructor(props) {
    super(props);
    this.state = {
      story: {},
      url: "Intercept.json",
      displayOptions: false,
      paragraph: [],
      choices: []
    };
    this.handleChoice = this.handleChoice.bind(this);
    this.handleNextSentence = this.handleNextSentence.bind(this);
    this.loadStory = this.loadStory.bind(this);
    this.setUrl = this.setUrl.bind(this);
  }

  handleParagraph(sentences, multiplier) {
    if (sentences === null)
      return;
    if (multiplier === null)
      multiplier = 1;
    const waitTime = 500;
    const min = 1000;
    var calc = Math.min(3000, Math.max(min, waitTime * multiplier));
    calc = isNaN(calc) ? min : calc;
    setTimeout(function () {
      const sentence = sentences[0];
      this.setState({ paragraph: this.state.paragraph.concat(sentence) });
      sentences.shift();
      if (sentences.length > 0)
        this.handleParagraph(sentences, sentence.split(" ").length);
      else {
        var choices = getChoices(this.state.story);
        this.setState({ choices: choices, displayOptions: true });
      }
    }.bind(this), calc);
  }

  handleNextSentence() {
    var sentence = getNext(this.state.story);
    this.handleParagraph(sentence);
  }


  handleChoice(index = null) {
    if (index !== null) {
      this.state.story.ChooseChoiceIndex(index);
    }

    this.setState({ choices: [], displayOptions: false });
    this.handleNextSentence();
  }

  loadStory() {
    let errorfilename = String.empty;
    axios.get(this.state.url)
      .then(response => {
        if (response.status === 200) {
          let story = new Story(response.data);
          this.setState({ story: story, paragraph: [], choices: [], displayOptions: false });
          this.handleNextSentence();
        }
        else {
        }
      }).catch(err => {
        errorfilename = "Error.json";
        this.setState({ url: errorfilename });
        this.loadStory();
      })
  }

  setUrl(url){
    this.setState({ url: url });
  }

  render() {
    const { url,paragraph, choices, displayOptions } = this.state;
    const totalLineIndex = Math.max(0, paragraph.length - 1);
    return (
      <Grommet theme={theme} full>
        <ResponsiveContext.Consumer>
          {size => (
            <Box fill>
              <AppBar url={url} onChange={this.setUrl} onClick={this.loadStory}/>
              <ConversationBox totalLineIndex={totalLineIndex} paragraph={paragraph}></ConversationBox>
              <OptionsMenu animation={displayOptions === true ? {} : {}} choices={choices} handleStory={this.handleChoice}></OptionsMenu>
            </Box>
          )}
        </ResponsiveContext.Consumer>
      </Grommet >
    );
  }
}

function getNext(story) {
  var list = [];
  while (story.canContinue) {
    list.push(story.Continue());
  }
  return list;
}

function getChoices(story) {
  return story.currentChoices.map(c => c);
}

export default App;