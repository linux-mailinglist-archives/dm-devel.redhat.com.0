Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB2D576445
	for <lists+dm-devel@lfdr.de>; Fri, 15 Jul 2022 17:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657898266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n3P6L2uhpavWV/8y1H3bUpnb64jOiD4AlOlnZLATqbE=;
	b=IonLIPlcA5Ip9990+JSnbM+aLSIUPp2HCR565QP0MmSHbWrdna/k38l3s/vUH4Pc5DiBWX
	iXTK3MBHdr8FB503QqoKdcL93qGl3UoQGidz91hCu0xH3lIPOxL26pUHKrW6OjkoeXXhhu
	84T3E2zAKKH9zgzHyjeOvzmjhUYy9MY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-y8ZlOtzAMHyNMrt5iFTSlA-1; Fri, 15 Jul 2022 11:17:44 -0400
X-MC-Unique: y8ZlOtzAMHyNMrt5iFTSlA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E85833C0D876;
	Fri, 15 Jul 2022 15:17:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8379B492CA2;
	Fri, 15 Jul 2022 15:17:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 142C01947079;
	Fri, 15 Jul 2022 15:17:34 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 771111947052
 for <dm-devel@listman.corp.redhat.com>; Fri, 15 Jul 2022 15:17:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 530AA2166B2A; Fri, 15 Jul 2022 15:17:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35EAB2166B26;
 Fri, 15 Jul 2022 15:17:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 26FFHSrJ023351;
 Fri, 15 Jul 2022 10:17:28 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 26FFHSsL023348;
 Fri, 15 Jul 2022 10:17:28 -0500
Date: Fri, 15 Jul 2022 10:17:27 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220715151727.GT10602@octiron.msp.redhat.com>
References: <20220713082043.22561-1-mwilck@suse.com>
 <20220713082043.22561-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220713082043.22561-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH v2 08/14] libmultipath:
 sysfs_attr_set_value(): don't return 0 on partial write
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 13, 2022 at 10:20:43AM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> sysfs_attr_set_value() returned 0 if not all requested bytes were written.
> Change this to return the number of bytes written. Error checking is now
> somewhat more involved; provide a helper macro for it.
> 

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/configure.c | 10 ++++--
>  libmultipath/discovery.c | 74 +++++++++++++++++++++++++---------------
>  libmultipath/sysfs.c     |  6 ++--
>  libmultipath/sysfs.h     | 10 ++++++
>  4 files changed, 66 insertions(+), 34 deletions(-)
> 
> diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> index 467bbaa..0607dba 100644
> --- a/libmultipath/configure.c
> +++ b/libmultipath/configure.c
> @@ -568,6 +568,7 @@ sysfs_set_max_sectors_kb(struct multipath *mpp, int is_reload)
>  	struct pathgroup * pgp;
>  	struct path *pp;
>  	char buff[11];
> +	ssize_t len;
>  	int i, j, ret, err = 0;
>  	struct udev_device *udd;
>  	int max_sectors_kb;
> @@ -600,14 +601,17 @@ sysfs_set_max_sectors_kb(struct multipath *mpp, int is_reload)
>  		}
>  	}
>  	snprintf(buff, 11, "%d", max_sectors_kb);
> +	len = strlen(buff);
>  
>  	vector_foreach_slot (mpp->pg, pgp, i) {
>  		vector_foreach_slot(pgp->paths, pp, j) {
>  			ret = sysfs_attr_set_value(pp->udev,
>  						   "queue/max_sectors_kb",
> -						   buff, strlen(buff));
> -			if (ret < 0) {
> -				condlog(1, "failed setting max_sectors_kb on %s : %s", pp->dev, strerror(-ret));
> +						   buff, len);
> +			if (ret != len) {
> +				log_sysfs_attr_set_value(1, ret,
> +					"failed setting max_sectors_kb on %s",
> +					pp->dev);
>  				err = 1;
>  			}
>  		}
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index 54b1caf..ee29009 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -598,13 +598,15 @@ sysfs_set_eh_deadline(struct path *pp)
>  		len = sprintf(value, "%d", pp->eh_deadline);
>  
>  	ret = sysfs_attr_set_value(hostdev, "eh_deadline",
> -				   value, len + 1);
> +				   value, len);
>  	/*
>  	 * not all scsi drivers support setting eh_deadline, so failing
>  	 * is totally reasonable
>  	 */
> -	if (ret <= 0)
> -		condlog(3, "%s: failed to set eh_deadline to %s, error %d", udev_device_get_sysname(hostdev), value, -ret);
> +	if (ret != len)
> +		log_sysfs_attr_set_value(3, ret,
> +			"%s: failed to set eh_deadline to %s",
> +			udev_device_get_sysname(hostdev), value);
>  
>  	udev_device_unref(hostdev);
>  	return (ret <= 0);
> @@ -667,19 +669,22 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
>  	    pp->fast_io_fail != MP_FAST_IO_FAIL_OFF) {
>  		/* Check if we need to temporarily increase dev_loss_tmo */
>  		if ((unsigned int)pp->fast_io_fail >= tmo) {
> +			ssize_t len;
> +
>  			/* Increase dev_loss_tmo temporarily */
>  			snprintf(value, sizeof(value), "%u",
>  				 (unsigned int)pp->fast_io_fail + 1);
> +			len = strlen(value);
>  			ret = sysfs_attr_set_value(rport_dev, "dev_loss_tmo",
> -						   value, strlen(value));
> -			if (ret <= 0) {
> +						   value, len);
> +			if (ret != len) {
>  				if (ret == -EBUSY)
>  					condlog(3, "%s: rport blocked",
>  						rport_id);
>  				else
> -					condlog(0, "%s: failed to set "
> -						"dev_loss_tmo to %s, error %d",
> -						rport_id, value, -ret);
> +					log_sysfs_attr_set_value(0, ret,
> +						"%s: failed to set dev_loss_tmo to %s",
> +						rport_id, value);
>  				goto out;
>  			}
>  		}
> @@ -691,32 +696,39 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
>  		pp->dev_loss = DEFAULT_DEV_LOSS_TMO;
>  	}
>  	if (pp->fast_io_fail != MP_FAST_IO_FAIL_UNSET) {
> +		ssize_t len;
> +
>  		if (pp->fast_io_fail == MP_FAST_IO_FAIL_OFF)
>  			sprintf(value, "off");
>  		else if (pp->fast_io_fail == MP_FAST_IO_FAIL_ZERO)
>  			sprintf(value, "0");
>  		else
>  			snprintf(value, 16, "%u", pp->fast_io_fail);
> +		len = strlen(value);
>  		ret = sysfs_attr_set_value(rport_dev, "fast_io_fail_tmo",
> -					   value, strlen(value));
> -		if (ret <= 0) {
> +					   value, len);
> +		if (ret != len) {
>  			if (ret == -EBUSY)
>  				condlog(3, "%s: rport blocked", rport_id);
>  			else
> -				condlog(0, "%s: failed to set fast_io_fail_tmo to %s, error %d",
> -					rport_id, value, -ret);
> +				log_sysfs_attr_set_value(0, ret,
> +					"%s: failed to set fast_io_fail_tmo to %s",
> +					rport_id, value);
>  		}
>  	}
>  	if (pp->dev_loss != DEV_LOSS_TMO_UNSET) {
> +		ssize_t len;
> +
>  		snprintf(value, 16, "%u", pp->dev_loss);
> -		ret = sysfs_attr_set_value(rport_dev, "dev_loss_tmo",
> -					   value, strlen(value));
> -		if (ret <= 0) {
> +		len = strlen(value);
> +		ret = sysfs_attr_set_value(rport_dev, "dev_loss_tmo", value, len);
> +		if (ret != len) {
>  			if (ret == -EBUSY)
>  				condlog(3, "%s: rport blocked", rport_id);
>  			else
> -				condlog(0, "%s: failed to set dev_loss_tmo to %s, error %d",
> -					rport_id, value, -ret);
> +				log_sysfs_attr_set_value(0, ret,
> +					"%s: failed to set dev_loss_tmo to %s",
> +					rport_id, value);
>  		}
>  	}
>  out:
> @@ -754,12 +766,16 @@ sysfs_set_session_tmo(struct path *pp)
>  			condlog(3, "%s: can't set fast_io_fail_tmo to '0'"
>  				"on iSCSI", pp->dev);
>  		} else {
> +			ssize_t len, ret;
> +
>  			snprintf(value, 11, "%u", pp->fast_io_fail);
> -			if (sysfs_attr_set_value(session_dev, "recovery_tmo",
> -						 value, strlen(value)) <= 0) {
> -				condlog(3, "%s: Failed to set recovery_tmo, "
> -					" error %d", pp->dev, errno);
> -			}
> +			len = strlen(value);
> +			ret = sysfs_attr_set_value(session_dev, "recovery_tmo",
> +						   value, len);
> +			if (ret != len)
> +				log_sysfs_attr_set_value(3, ret,
> +					"%s: Failed to set recovery_tmo to %s",
> +							 pp->dev, value);
>  		}
>  	}
>  	udev_device_unref(session_dev);
> @@ -802,12 +818,16 @@ sysfs_set_nexus_loss_tmo(struct path *pp)
>  		pp->sg_id.channel, pp->sg_id.scsi_id, end_dev_id);
>  
>  	if (pp->dev_loss != DEV_LOSS_TMO_UNSET) {
> +		ssize_t len, ret;
> +
>  		snprintf(value, 11, "%u", pp->dev_loss);
> -		if (sysfs_attr_set_value(sas_dev, "I_T_nexus_loss_timeout",
> -					 value, strlen(value)) <= 0)
> -			condlog(3, "%s: failed to update "
> -				"I_T Nexus loss timeout, error %d",
> -				pp->dev, errno);
> +		len = strlen(value);
> +		ret = sysfs_attr_set_value(sas_dev, "I_T_nexus_loss_timeout",
> +					   value, len);
> +		if (ret != len)
> +			log_sysfs_attr_set_value(3, ret,
> +				"%s: failed to update I_T Nexus loss timeout",
> +				pp->dev);
>  	}
>  	udev_device_unref(sas_dev);
>  	return;
> diff --git a/libmultipath/sysfs.c b/libmultipath/sysfs.c
> index 125f1c2..9c84af7 100644
> --- a/libmultipath/sysfs.c
> +++ b/libmultipath/sysfs.c
> @@ -134,7 +134,7 @@ ssize_t sysfs_attr_set_value(struct udev_device *dev, const char *attr_name,
>  	/* write attribute value */
>  	fd = open(devpath, O_WRONLY);
>  	if (fd < 0) {
> -		condlog(2, "%s: attribute '%s' can not be opened: %s",
> +		condlog(3, "%s: attribute '%s' can not be opened: %s",
>  			__func__, devpath, strerror(errno));
>  		return -errno;
>  	}
> @@ -144,11 +144,9 @@ ssize_t sysfs_attr_set_value(struct udev_device *dev, const char *attr_name,
>  		size = -errno;
>  		condlog(3, "%s: write to %s failed: %s", __func__, 
>  			devpath, strerror(errno));
> -	} else if (size < (ssize_t)value_len) {
> +	} else if (size < (ssize_t)value_len)
>  		condlog(3, "%s: underflow writing %zu bytes to %s. Wrote %zd bytes",
>  			__func__, value_len, devpath, size);
> -		size = 0;
> -	}
>  
>  	close(fd);
>  	return size;
> diff --git a/libmultipath/sysfs.h b/libmultipath/sysfs.h
> index cdc84e4..799f68e 100644
> --- a/libmultipath/sysfs.h
> +++ b/libmultipath/sysfs.h
> @@ -5,6 +5,7 @@
>  #ifndef _LIBMULTIPATH_SYSFS_H
>  #define _LIBMULTIPATH_SYSFS_H
>  #include <stdbool.h>
> +#include "strbuf.h"
>  
>  ssize_t sysfs_attr_set_value(struct udev_device *dev, const char *attr_name,
>  			     const char * value, size_t value_len);
> @@ -25,6 +26,15 @@ ssize_t sysfs_bin_attr_get_value(struct udev_device *dev, const char *attr_name,
>  		sysfs_attr_value_ok(__rc, __l); \
>  	})
>  
> +#define log_sysfs_attr_set_value(prio, rc, fmt, __args...)		\
> +do {									\
> +	STRBUF_ON_STACK(__buf);						\
> +	if (print_strbuf(&__buf, fmt, ##__args) >= 0 &&			\
> +	    print_strbuf(&__buf, ": %s", rc < 0 ? strerror(-rc) :	\
> +					"write underflow") >= 0)	\
> +		condlog(prio, "%s", get_strbuf_str(&__buf));		\
> +} while(0)
> +
>  int sysfs_get_size (struct path *pp, unsigned long long * size);
>  int sysfs_check_holders(char * check_devt, char * new_devt);
>  bool sysfs_is_multipathed(struct path *pp, bool set_wwid);
> -- 
> 2.36.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

