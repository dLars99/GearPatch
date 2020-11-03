using System.Threading.Tasks;
using GearPatch.Hubs.Clients;
using Microsoft.AspNetCore.SignalR;

namespace GearPatch.Hubs
{
    public class MessageHub : Hub<IMessageClient>
    {
        public async Task SendMessage(int messageCount)
        {
            await Clients.All.UpdateCount(messageCount);
        }
    }
}
