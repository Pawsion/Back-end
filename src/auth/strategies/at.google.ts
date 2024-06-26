import { PassportStrategy } from '@nestjs/passport';
import { Strategy, VerifyCallback } from 'passport-google-oauth20';
import { config } from 'dotenv';

import { Injectable } from '@nestjs/common';

config();

@Injectable()
export class GoogleStrategy extends PassportStrategy(Strategy, 'google') {

  constructor() {
    super({
      clientID: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_SECRET,
      callbackURL: 'http://localhost:8080/auth/redirect',
      scope: ['email', 'profile'],
    });
  }

  async validate (_accessToken: string, _refreshToken: string, profile: any, done: VerifyCallback): Promise<any> {
    const { name, emails } = profile
    const user = {
      provider: 'google',
      email: emails[0].value,
      firstName: name.givenName,
      lastName: name.familyName,
      _refreshToken,
      _accessToken
    }
    done(null, user);
  }
}