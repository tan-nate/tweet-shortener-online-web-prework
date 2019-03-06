require 'pry'

def dictionary
  {
    :hello => "hi",
    :to => "2",
    :two => "2",
    :too => "2",
    :for => "4",
    :four => "4",
    :be => "b",
    :you => "u",
    :at => "@",
    :and => "&"
  }
end

def word_substituter(tweet)
  split_tweet = tweet.split
  long_word_keys = dictionary.keys
  abbreviated_array = split_tweet.collect do |tweet_word|
    new_key = long_word_keys.find do |long_word_key|
      long_word_key == tweet_word.downcase.to_sym
    end
    if new_key == nil
      tweet_word = tweet_word
    else
      tweet_word = dictionary[new_key]
    end
  end
  abbreviated_array.join(" ")
end

def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  if selective_tweet_shortener(tweet).length > 140
    "#{word_substituter(tweet)[0...137]}..."
  else
    selective_tweet_shortener(tweet)
  end
end