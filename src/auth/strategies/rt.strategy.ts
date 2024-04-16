import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { Request } from 'express';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { Payload } from '../utils/types';

@Injectable()
export class RtStrategy extends PassportStrategy(Strategy, 'jwt-refresh') {
  constructor() {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      secretOrKey: process.env.RT_SECRET,
      passReqToCallback: true,
    });
  }

  async validate(req: Request, payload: Payload) {
    const refreshToken = req.get('authorization').replace('Bearer', '').trim();
    // const user = await this.userService.findOne(payload.sub);
    return {
      ...payload,
      refreshToken,
      // user,
    };
  }
}
