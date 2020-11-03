using System.Threading.Tasks;

namespace GearPatch.Hubs.Clients
{
    public interface IMessageClient
    {
        Task UpdateCount(int messageCount);
    }
}
