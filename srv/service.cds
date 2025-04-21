using {com.manage as db} from '../db/schema';

@path    : '/achieve'
@requires: 'authenticated-user'
service AchieveGoalsService {

    @odata.draft.enabled
    entity Tasks     as projection on db.Tasks
                        where
                            createdBy = $user;

    @odata.draft.enabled
    entity Goals     as projection on db.Goals
                        where
                            createdBy = $user;

    @odata.draft.enabled
    entity Resources as projection on db.Resources
                        where
                            createdBy = $user;

    @readonly
    entity Users     as projection on db.Users;

}
