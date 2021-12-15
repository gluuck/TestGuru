// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree
require("bootstrap/dist/js/bootstrap")
import Rails from "@rails/ujs"
import mrujs from "mrujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
import './src/application.scss'

Rails.start()
mrujs.start()
Turbolinks.start()
ActiveStorage.start()
