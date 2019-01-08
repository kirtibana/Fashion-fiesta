package model;

public class Category {

	private int id;
	private String name,description;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
//		if( !name.equals("kaddu") )
			this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category() {
		
	}

	@Override
	public String toString() {
		return "Category [name=" + name + ", description=" + description + "]";
	}
	
}
