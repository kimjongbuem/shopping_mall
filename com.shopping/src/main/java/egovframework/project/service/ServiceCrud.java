package egovframework.project.service;

public interface ServiceCrud<Entity> {
	void create(Entity entity);
    void update(Entity entity);
    Entity read(Long id);
    void delete(Long id);
}
