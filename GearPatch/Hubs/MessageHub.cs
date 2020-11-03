using System.Threading.Tasks;
using GearPatch.Hubs.Clients;
using Microsoft.AspNetCore.SignalR;

namespace GearPatch.Hubs
{
    public class MessageHub : Hub<IMessageClient>
    {    }
}
