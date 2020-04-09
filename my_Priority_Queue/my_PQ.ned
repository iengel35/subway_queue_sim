
import org.omnetpp.queueing.Block_server;
import org.omnetpp.queueing.Classifier;
import org.omnetpp.queueing.Delay;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


//
// TODO documentation
//
network my_PQ
{
    @display("bgb=689,411");
    submodules:
        source: Source {
            @display("p=57,59");
        }
        source1: Source {
            @display("p=57,175");
        }
        classifier: Classifier {
            @display("p=132,110");
        }
        passiveQueue: PassiveQueue {
            @display("p=194,59");
        }
        passiveQueue1: PassiveQueue {
            @display("p=194,175");
        }
        sink: Sink {
            @display("p=601,142");
        }
        server: Server {
            @display("p=268,59");
        }
        server1: Server {
            @display("p=298,175");
        }
        delay: Delay {
            @display("p=364,175");
        }
        delay1: Delay {
            @display("p=351,59");
        }
        delay2: Delay {
            @display("p=422,56");
        }
        delay3: Delay {
            @display("p=488,59");
        }
    connections:
        source.out --> classifier.in++;
        source1.out --> classifier.in++;
        classifier.out++ --> passiveQueue1.in++;
        classifier.out++ --> passiveQueue.in++;
        classifier.rest --> passiveQueue1.in++;
        classifier.out++ --> passiveQueue.in++;
        passiveQueue.out++ --> server.in++;
        passiveQueue1.out++ --> server1.in++;
        server1.out --> delay.in++;
        delay.out --> {  delay = 18 s; } --> sink.in++;
        server.out --> delay1.in++;
        delay1.out -->{  delay = 6 s; } --> delay2.in++;
        delay2.out -->{  delay = 6 s; } --> delay3.in++;
        delay3.out --> {  delay = 6 s; } --> sink.in++;
}

