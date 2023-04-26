package data.station;

public class StationItem {
	String nodeid;
	String nodename;

	public String getNodeid() {
		return nodeid;
	}

	public String getNodename() {
		return nodename;
	}

	@Override
	public String toString() {
		return "Station [nodeid=" + nodeid + ", nodename=" + nodename + "]";
	}
	

}
