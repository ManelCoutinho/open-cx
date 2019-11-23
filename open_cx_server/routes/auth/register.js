const register = require('express').Router();
const User = require('../../models/user');
const {
  registerValidation,
  loginValidation
} = require('../../validation');

register.post('/register', async (req, res) => {
  // Validate the data
  const {
    error
  } = registerValidation(req.body);
  if (error) return res.status(400).send(error.details[0].message);

  // Check if user is already in the database
  const emailExists = await User.findOne({email: req.body.email});
  if (emailExists) return res.status(400).send('Email already exists');

  // Create new user
  const user = new User({
    fullname: req.body.fullname,
    email: req.body.email,
    password: req.body.password
  });

  try {
    const savedUser = await user.save();
    res.send(savedUser);
  } catch (err) {
    res.status(400).send(err);
  }
});

module.exports = register;