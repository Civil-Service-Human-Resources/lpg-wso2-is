package uk.gov.cslearning.wso2.user;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.wso2.carbon.user.api.RealmConfiguration;
import org.wso2.carbon.user.core.UserRealm;
import org.wso2.carbon.user.core.UserStoreException;
import org.wso2.carbon.user.core.claim.ClaimManager;
import org.wso2.carbon.user.core.jdbc.JDBCUserStoreManager;
import org.wso2.carbon.user.core.profile.ProfileConfigurationManager;

import java.util.Map;

public class UserStoreManager extends JDBCUserStoreManager {

    private static Log LOG = LogFactory.getLog(UserStoreManager.class);

    public UserStoreManager(RealmConfiguration realmConfig, Map<String, Object> properties, ClaimManager
            claimManager, ProfileConfigurationManager profileManager, UserRealm realm, Integer tenantId)
            throws UserStoreException {
        super(realmConfig, properties, claimManager, profileManager, realm, tenantId);
        LOG.info("UserStoreManager initialized...");
    }

    @Override
    public Map<String, String> getUserPropertyValues(String userName, String[] propertyNames, String profileName) throws UserStoreException {
        LOG.debug("getUserPropertyValues for " + userName);
        return super.getUserPropertyValues(userName, propertyNames, profileName);
    }

    @Override
    public void doSetUserClaimValue(String userName, String claimURI, String claimValue, String profileName) throws UserStoreException {
        LOG.debug("doSetUserClaimValue for " + userName);
        if (claimURI.startsWith("http://cslearning.gov.uk/claims")) {
            LOG.debug("BOOM");
        } else {
            super.doSetUserClaimValue(userName, claimURI, claimValue, profileName);
        }
    }

    @Override
    public void doSetUserClaimValues(String userName, Map<String, String> claims, String profileName) throws UserStoreException {
        LOG.debug("doSetUserClaimValues for " + userName);
        super.doSetUserClaimValues(userName, claims, profileName);
    }
}
