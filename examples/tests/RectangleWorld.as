/*
 *
 *  ND2D - A Flash Molehill GPU accelerated 2D engine
 *
 *  Author: Lars Gerckens
 *  Copyright (c) nulldesign 2011
 *  Repository URL: http://github.com/nulldesign/nd2d
 *
 *
 *  Licence Agreement
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 * /
 */

/**
 * (c) 2010 by nulldesign
 * Created by lars
 * Date: 26.04.11 14:38
 */
package tests {
    import de.nulldesign.nd2d.display.Scene2D;
    import de.nulldesign.nd2d.display.Sprite2D;
    import de.nulldesign.nd2d.display.World2D;

    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.geom.Rectangle;

    public class RectangleWorld extends World2D {

        [Embed(source="/assets/crate.jpg")]
        private var texture:Class;

        private var scene:Scene2D;
        private var s1:Sprite2D;
        private var s2:Sprite2D;

        public function RectangleWorld(renderMode:String, frameRate:uint, bounds:Rectangle = null) {
            super(renderMode, frameRate, false, bounds);

            statsVisible = false;

            scene = new Scene2D();
            scene.backGroundColor = 0xDDDDDD;

            s1 = new Sprite2D(new texture().bitmapData);
            scene.addChild(s1);

            s2 = new Sprite2D(new texture().bitmapData);
            s2.x = bounds.width;
            s2.y = bounds.height;
            scene.addChild(s2);

            setActiveScene(scene);
            addEventListener(Event.ENTER_FRAME, loop);
        }

        private function loop(e:Event):void {
            s1.rotation = s2.rotation += 1;
        }
    }
}
