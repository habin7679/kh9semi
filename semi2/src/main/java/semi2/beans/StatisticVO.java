package semi2.beans;

//DB와 상관없이 일회용으로 쓰기 위한 클래스
//값이 담겨있는 객체라고 해서 VO(Value Object)라고 부름
public class StatisticVO {
	private String type;
	private int count, min, max;
	private double average;
	public StatisticVO() {
		super();
	}
	@Override
	public String toString() {
		return "StatisticVO [type=" + type + ", count=" + count + ", min=" + min + ", max=" + max + ", average="
				+ average + "]";
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public double getAverage() {
		return average;
	}
	public void setAverage(double average) {
		this.average = average;
	}
}