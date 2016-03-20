(ns bob (:require [clojure.string :as str]))

(defn shout?
  [string]
  (and 
    (re-find #"[A-Z]" string)
    (= string (str/upper-case string))))

(defn question?
  [string]
  (str/ends-with? string "?"))

(defn silence?
  [string]
  (str/blank? (str/trim string)))

(defn response-for 
  [string] 
  (cond (shout? string) "Whoa, chill out!"
        (question? string) "Sure."
        (silence? string) "Fine. Be that way!"
        :else "Whatever."))
