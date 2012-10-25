using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using PlayerIO.GameLibrary;
using System.Drawing;

namespace MyGame {
	public class Player : BasePlayer {
		public string Name;
        public string TestVar;
        public int Walk;
        public int Class;
	}
    [RoomType("raid")]
    public class LobbyCode : Game<Player>
    {
        // This method is called when an instance of your the game is created
        public override void GameStarted()
        {
            // anything you write to the Console will show up in the 
            // output window of the development server
            Console.WriteLine("Game is started: " + RoomId);

            // This is how you setup a timer
            AddTimer(delegate
            {
                // code here will code every 100th millisecond (ten times a second)
            }, 100);

            // Debug Example:
            // Sometimes, it can be very usefull to have a graphical representation
            // of the state of your game.
            // An easy way to accomplish this is to setup a timer to update the
            // debug view every 250th second (4 times a second).
            AddTimer(delegate
            {
                // This will cause the GenerateDebugImage() method to be called
                // so you can draw a grapical version of the game state.
                RefreshDebugView();
            }, 250);
        }

        // This method is called when the last player leaves the room, and it's closed down.
        public override void GameClosed()
        {
            Console.WriteLine("RoomId: " + RoomId);
        }

        // This method is called whenever a player joins the game
        public override void UserJoined(Player player)
        {
            // this is how you send a player a message
            player.Send("hello");
            player.Send("setUserID", player.Id);
            

            // this is how you broadcast a message to all players connected to the game
            Broadcast("UserJoined", player.Id, player.Class);
        }

        // This method is called when a player leaves the game
        public override void UserLeft(Player player)
        {
            Broadcast("UserLeft", player.Id);
        }

        // This method is called when a player sends a message into the server code
        public override void GotMessage(Player player, Message message)
        {
            switch (message.Type)
            {
                // This is how you would set a players name when they send in their name in a 
                // "MyNameIs" message
                case "MyNameIs":
                    player.Name = message.GetString(0);
                    break;
                case "test":
                    player.TestVar = message.GetString(0) + " is from server";
                    player.Send("testrecieved", player.TestVar);
                    break;
                case "walk":
                    player.Walk = message.GetInt(0);
                    Broadcast("SendWalk", player.Id, player.Walk);
                    break;
                case "stopwalk":
                    player.Walk = message.GetInt(0);
                    Broadcast("StopWalk", player.Id, player.Walk);
                    break;
                case "SendSpawn":
                    Broadcast("SendSpawn", message.GetInt(0), player.Class, player.Name, message.GetInt(1), message.GetInt(2));
                    break;
                case "SetClass":
                    player.Class = message.GetInt(0);
                    break;
                case "SetName":
                    player.Name = message.GetString(0);
                    break;
                case "SendChat":
                    Broadcast("RecieveChat", message.GetString(0), player.Name);
                    break;
                case "ping":
                    player.Send("pong");
                    break;
            }
        }

        Point debugPoint;

        // This method get's called whenever you trigger it by calling the RefreshDebugView() method.
        public override System.Drawing.Image GenerateDebugImage()
        {
            // we'll just draw 400 by 400 pixels image with the current time, but you can
            // use this to visualize just about anything.
            var image = new Bitmap(400, 400);
            using (var g = Graphics.FromImage(image))
            {
                // fill the background
                g.FillRectangle(Brushes.Blue, 0, 0, image.Width, image.Height);

                // draw the current time
                g.DrawString(DateTime.Now.ToString(), new Font("Verdana", 20F), Brushes.Orange, 10, 10);

                // draw a dot based on the DebugPoint variable
                g.FillRectangle(Brushes.Red, debugPoint.X, debugPoint.Y, 5, 5);
            }
            return image;
        }

        // During development, it's very usefull to be able to cause certain events
        // to occur in your serverside code. If you create a public method with no
        // arguments and add a [DebugAction] attribute like we've down below, a button
        // will be added to the development server. 
        // Whenever you click the button, your code will run.
        [DebugAction("Play", DebugAction.Icon.Play)]
        public void PlayNow()
        {
            Console.WriteLine("The play button was clicked!");
        }

        // If you use the [DebugAction] attribute on a method with
        // two int arguments, the action will be triggered via the
        // debug view when you click the debug view on a running game.
        [DebugAction("Set Debug Point", DebugAction.Icon.Green)]
        public void SetDebugPoint(int x, int y)
        {
            debugPoint = new Point(x, y);
        }
    }
}
