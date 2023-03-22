package feateurs;

import com.intuit.karate.junit5.Karate;

public class KarateRunner {
	
	@Karate.Test
	public Karate test() {
		return Karate
				.run("postCalls.feature")
				.tags("@data-driven")
				.relativeTo(getClass());
	}

}
