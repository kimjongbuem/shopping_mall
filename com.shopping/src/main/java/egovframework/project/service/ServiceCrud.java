package egovframework.project.service;

public interface ServiceCrud<Entity> {
	int create(Entity entity);
    int update(Entity entity);
    int read(Long id);
    int delete(Long id);
}
