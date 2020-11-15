#!/usr/bin/env python3

import argparse

from moviepy.editor import VideoClip
import vapory as v


class JuggleCascade:
    def __init__(self,
                 height=3.0, hand_sep=1.0, hand_sway=0.2,
                 toss_time=1.0, hand_time=0.6):
        self.height = height
        self.hand_sep = hand_sep
        self.hand_sway = hand_sway
        self.toss_time = toss_time
        self.hand_time = hand_time

    def single_sphere_position(self, time):
        if 0.0 <= time <= self.toss_time:
            para_t = (time-0.0) / (self.toss_time)
            return (self.hand_sway + para_t*self.hand_sep - self.hand_sep/2,
                    0,
                    self.height * (para_t - para_t*para_t))
        elif self.toss_time <= time <= self.toss_time+self.hand_time:
            para_t = (time - self.toss_time) / self.hand_time
            return (self.hand_sep/2 + self.hand_sway - 2*para_t*self.hand_sway,
                    0,
                    0)
        elif self.toss_time+self.hand_time <= time <= 2*self.toss_time+self.hand_time:
            para_t = (time - self.toss_time - self.hand_time) / self.toss_time
            return (-self.hand_sway - para_t*self.hand_sep + self.hand_sep/2,
                    0,
                    self.height * (para_t - para_t*para_t))
        elif 2*self.toss_time+self.hand_time <= time <= 2*self.toss_time + 2*self.hand_time:
            para_t = (time - 2*self.toss_time - self.hand_time) / self.hand_time
            return (-self.hand_sep/2 - self.hand_sway + 2*para_t*self.hand_sway,
                    0,
                    0)
        else:
            assert False

    def sphere_positions(self, time):
        tdiff = self.period()
        return [self.single_sphere_position(time),
                self.single_sphere_position(time + tdiff),
                self.single_sphere_position(time + 2*tdiff),
        ]

    def period(self):
        return (self.toss_time + self.hand_time) * 2/3

    def scene(self, time):
        camera = v.Camera(
            'location', [0, -5.0, 0],
            'look_at', [0, 0, 0],
            'right', '(image_width/image_height)*x',
            'up', 'z',
            'sky', 'z',
            )

        light = v.LightSource([10, -10, 10],
                              'color', 1)

        background = v.Plane('z', -5,
                             v.Texture(v.Pigment('color', [.6, .3, .3])))

        texture = v.Texture(v.Pigment('granite',
                                      'scale',2,
                                      v.PigmentMap([0, 'rgb', [1,0,0]],
                                                   [1, 'rgb', [1.0,.4,.4]])
                                      )
                            )

        spheres = [v.Sphere(pos, 0.1, texture) for pos
                   in self.sphere_positions(time)]

        return v.Scene(camera,
                       objects=[light, background]+spheres)

def make_frame(time, width, height):
    return scene(time).render(width=width, height=height)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-r','--resolution', type=int, nargs=2, default=(360,240))
    parser.add_argument('-t','--time', type=float, default=0.0)
    parser.add_argument('-e','--end-time', type=float, default=None)
    parser.add_argument('--fps', type=float, default=24)
    parser.add_argument('-o','--output', type=str, required=True)

    parser.add_argument('--hand-sep', type=float, default=1.0)
    parser.add_argument('--hand-sway', type=float, default=0.2)
    parser.add_argument('--ball-height', type=float, default=1.0)
    parser.add_argument('--toss-time', type=float, default=1.0)
    parser.add_argument('--hand-time', type=float, default=0.6)

    args = parser.parse_args()

    width = args.resolution[0]
    height = args.resolution[1]

    cascade = JuggleCascade(height = args.ball_height,
                            hand_sep = args.hand_sep,
                            hand_sway = args.hand_sway,
                            toss_time = args.toss_time,
                            hand_time = args.hand_time)

    if args.end_time is None:
        args.end_time = cascade.period()

    if args.output.endswith('.gif'):
        clip = VideoClip(lambda t:(cascade
                                   .scene(time=t+args.time)
                                   .render(width=width, height=height)),
                         duration = args.end_time-args.time)
        clip.write_gif(args.output, fps=args.fps,
                       program='ffmpeg')
        print('')
    else:
        cascade.scene(args.time).render(
            width=args.resolution[0],
            height=args.resolution[1],
            outfile=args.output)

if __name__=='__main__':
    main()
