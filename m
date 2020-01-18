Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 96A7F1418C8
	for <lists+dm-devel@lfdr.de>; Sat, 18 Jan 2020 18:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579368937;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d14AOwlI2Bez12ZQEkXzjKuDUkt4SPM7rbyrlT7+bps=;
	b=A8J9ZIFC+QqAtKSC4SAt5aOtwaWhDbI9A/VuPgSlLoavvGA1i+rU4l6Xk5kMeKXDg/RABr
	CznielWsDgD/mU7T1AcP4gX0ujfufWsqimjSb1BWGhxKizolJYziPkLTsnwmjk84HPp3Sj
	skmyzabgq3XD/LSG5XzfMfNwp/17edA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-JZzCsT6RPQWNvPP6cGbEVQ-1; Sat, 18 Jan 2020 12:35:34 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82AE4107ACCD;
	Sat, 18 Jan 2020 17:35:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC52F5C28F;
	Sat, 18 Jan 2020 17:35:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35C0B1809567;
	Sat, 18 Jan 2020 17:35:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00IHYiGZ020624 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 18 Jan 2020 12:34:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7447610DCF4B; Sat, 18 Jan 2020 17:34:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F65910DCF47
	for <dm-devel@redhat.com>; Sat, 18 Jan 2020 17:34:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62B651019282
	for <dm-devel@redhat.com>; Sat, 18 Jan 2020 17:34:42 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
	[172.104.24.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-317-xsnYoIpxPNScnqpkPUo5Iw-1; Sat, 18 Jan 2020 12:34:40 -0500
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 6FEAA23CBD;
	Sat, 18 Jan 2020 12:34:39 -0500 (EST)
Received: by quad.stoffel.org (Postfix, from userid 1000)
	id E19B3A5F19; Sat, 18 Jan 2020 12:34:38 -0500 (EST)
MIME-Version: 1.0
Message-ID: <24099.16814.876570.188848@quad.stoffel.home>
Date: Sat, 18 Jan 2020 12:34:38 -0500
From: "John Stoffel" <john@stoffel.org>
To: Benjamin Marzinski <bmarzins@redhat.com>
In-Reply-To: <1579227500-17196-10-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-10-git-send-email-bmarzins@redhat.com>
X-MC-Unique: xsnYoIpxPNScnqpkPUo5Iw-1
X-MC-Unique: JZzCsT6RPQWNvPP6cGbEVQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00IHYiGZ020624
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: Re: [dm-devel] [PATCH 09/15] libmultipath: add code to get
	vendor	specific vpd data
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>>>> "Benjamin" == Benjamin Marzinski <bmarzins@redhat.com> writes:

Benjamin> This adds the wildcard 'g' for multipath and path formatted
Benjamin> printing, which returns extra data from a device's vendor
Benjamin> specific vpd page.  The specific vendor vpd page to use, and
Benjamin> the vendor/product id to decode it can be set in the hwentry
Benjamin> with vpd_vendor_pg and vpd_vendor_id. It can be configured
Benjamin> in the devices section of multipath.conf with the vpd_vendor
Benjamin> parameter. Currently, the only devices that use this are HPE
Benjamin> 3PAR arrays, to return the Volume Name.

So I've looked over this patch and I see how you've hard-coded the
3par entry into the various .c files, but the multipathd.conf example
really doesn't give a good example of how to use it, nor does the code
give a good example, or maybe better yet a template set of functions
for parsing custom VPD info pages.  This is really just a nit.  

Also, is the Vendor VPD page always at 0xco, or is that just a 3par
setting?  I wonder if that constant should be pulled into a #define
somewhere, so that it's simpler to update/change as needed?
Especially if other vendors use different pages.

John



Benjamin> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
Benjamin> ---
Benjamin>  libmultipath/config.c      |  4 ++++
Benjamin>  libmultipath/config.h      |  2 ++
Benjamin>  libmultipath/dict.c        | 34 ++++++++++++++++++++++++++++++++++
Benjamin>  libmultipath/discovery.c   | 34 +++++++++++++++++++++++++++++++++-
Benjamin>  libmultipath/hwtable.c     |  2 ++
Benjamin>  libmultipath/print.c       | 27 +++++++++++++++++++++++++++
Benjamin>  libmultipath/propsel.c     | 24 ++++++++++++++++++++++++
Benjamin>  libmultipath/propsel.h     |  2 ++
Benjamin>  libmultipath/structs.h     |  9 +++++++++
Benjamin>  multipath/multipath.conf.5 |  8 ++++++++
Benjamin>  10 files changed, 145 insertions(+), 1 deletion(-)

Benjamin> diff --git a/libmultipath/config.c b/libmultipath/config.c
Benjamin> index 85626e96..72b8d37c 100644
Benjamin> --- a/libmultipath/config.c
Benjamin> +++ b/libmultipath/config.c
Benjamin> @@ -369,6 +369,8 @@ merge_hwe (struct hwentry * dst, struct hwentry * src)
Benjamin>  	merge_num(max_sectors_kb);
Benjamin>  	merge_num(ghost_delay);
Benjamin>  	merge_num(all_tg_pt);
Benjamin> +	merge_num(vpd_vendor_pg);
Benjamin> +	merge_num(vpd_vendor_id);
Benjamin>  	merge_num(san_path_err_threshold);
Benjamin>  	merge_num(san_path_err_forget_rate);
Benjamin>  	merge_num(san_path_err_recovery_time);
Benjamin> @@ -517,6 +519,8 @@ store_hwe (vector hwtable, struct hwentry * dhwe)
hwe-> detect_prio = dhwe->detect_prio;
hwe-> detect_checker = dhwe->detect_checker;
hwe-> ghost_delay = dhwe->ghost_delay;
Benjamin> +	hwe->vpd_vendor_pg = dhwe->vpd_vendor_pg;
Benjamin> +	hwe->vpd_vendor_id = dhwe->vpd_vendor_id;
 
Benjamin>  	if (dhwe->bl_product && !(hwe->bl_product = set_param_str(dhwe->bl_product)))
Benjamin>  		goto out;
Benjamin> diff --git a/libmultipath/config.h b/libmultipath/config.h
Benjamin> index e69aa07c..589146de 100644
Benjamin> --- a/libmultipath/config.h
Benjamin> +++ b/libmultipath/config.h
Benjamin> @@ -87,6 +87,8 @@ struct hwentry {
Benjamin>  	int max_sectors_kb;
Benjamin>  	int ghost_delay;
Benjamin>  	int all_tg_pt;
Benjamin> +	int vpd_vendor_pg;
Benjamin> +	int vpd_vendor_id;
Benjamin>  	char * bl_product;
Benjamin>  };
 
Benjamin> diff --git a/libmultipath/dict.c b/libmultipath/dict.c
Benjamin> index 2b046e1d..d6d8b79b 100644
Benjamin> --- a/libmultipath/dict.c
Benjamin> +++ b/libmultipath/dict.c
Benjamin> @@ -1366,6 +1366,39 @@ def_uxsock_timeout_handler(struct config *conf, vector strvec)
Benjamin>  	return 0;
Benjamin>  }
 
Benjamin> +static int
Benjamin> +hw_vpd_vendor_handler(struct config *conf, vector strvec)
Benjamin> +{
Benjamin> +	int rc = 0;
Benjamin> +	char *buff;
Benjamin> +
Benjamin> +	struct hwentry * hwe = VECTOR_LAST_SLOT(conf->hwtable);
Benjamin> +	if (!hwe)
Benjamin> +		return 1;
Benjamin> +
Benjamin> +	buff = set_value(strvec);
Benjamin> +	if (!buff)
Benjamin> +		return 1;
Benjamin> +	if (strcmp(buff, "hp3par") == 0) {
Benjamin> +		hwe->vpd_vendor_pg = 0xc0;
Benjamin> +		hwe->vpd_vendor_id = VPD_VP_HP3PAR;
Benjamin> +	} else
Benjamin> +		rc = 1;
Benjamin> +	FREE(buff);
Benjamin> +	return rc;
Benjamin> +}
Benjamin> +
Benjamin> +static int
Benjamin> +snprint_hw_vpd_vendor(struct config *conf, char * buff, int len,
Benjamin> +		      const void * data)
Benjamin> +{
Benjamin> +	const struct hwentry * hwe = (const struct hwentry *)data;
Benjamin> +
Benjamin> +	if (hwe->vpd_vendor_pg == 0xc0 && hwe->vpd_vendor_id == VPD_VP_HP3PAR)
Benjamin> +		return snprintf(buff, len, "hp3par");
Benjamin> +	return 0;
Benjamin> +}
Benjamin> +
Benjamin>  /*
Benjamin>   * blacklist block handlers
Benjamin>   */
Benjamin> @@ -1806,6 +1839,7 @@ init_keywords(vector keywords)
Benjamin>  	install_keyword("max_sectors_kb", &hw_max_sectors_kb_handler, &snprint_hw_max_sectors_kb);
Benjamin>  	install_keyword("ghost_delay", &hw_ghost_delay_handler, &snprint_hw_ghost_delay);
Benjamin>  	install_keyword("all_tg_pt", &hw_all_tg_pt_handler, &snprint_hw_all_tg_pt);
Benjamin> +	install_keyword("vpd_vendor", &hw_vpd_vendor_handler, &snprint_hw_vpd_vendor);
Benjamin>  	install_sublevel_end();
 
Benjamin>  	install_keyword_root("overrides", &overrides_handler);
Benjamin> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
Benjamin> index 1d79cbae..d2773c3a 100644
Benjamin> --- a/libmultipath/discovery.c
Benjamin> +++ b/libmultipath/discovery.c
Benjamin> @@ -1103,6 +1103,30 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
Benjamin>  	return len;
Benjamin>  }
 
Benjamin> +static int
Benjamin> +parse_vpd_c0_hp3par(const unsigned char *in, size_t in_len,
Benjamin> +		    char *out, size_t out_len)
Benjamin> +{
Benjamin> +	size_t len;
Benjamin> +
Benjamin> +	memset(out, 0x0, out_len);
Benjamin> +	if (in_len <= 4 || (in[4] > 3 && in_len < 44)) {
Benjamin> +		condlog(3, "HP/3PAR vendor specific VPD page length too short: %lu", in_len);
Benjamin> +		return -EINVAL;
Benjamin> +	}
Benjamin> +	if (in[4] <= 3) /* revision must be > 3 to have Vomlume Name */
Benjamin> +		return -ENODATA;
Benjamin> +	len = get_unaligned_be32(&in[40]);
Benjamin> +	if (len > out_len || len + 44 > in_len) {
Benjamin> +		condlog(3, "HP/3PAR vendor specific Volume name too long: %lu",
Benjamin> +			len);
Benjamin> +		return -EINVAL;
Benjamin> +	}
Benjamin> +	memcpy(out, &in[44], len);
Benjamin> +	out[out_len - 1] = '\0';
Benjamin> +	return len;
Benjamin> +}
Benjamin> +
Benjamin>  static int
Benjamin>  get_vpd_sysfs (struct udev_device *parent, int pg, char * str, int maxlen)
Benjamin>  {
Benjamin> @@ -1170,7 +1194,9 @@ get_vpd_sgio (int fd, int pg, int vend_id, char * str, int maxlen)
Benjamin>  			len = (buff_len <= maxlen)? buff_len : maxlen;
Benjamin>  			memcpy (str, buff, len);
Benjamin>  		}
Benjamin> -	} else
Benjamin> +	} else if (pg == 0xc0 && vend_id == VPD_VP_HP3PAR)
Benjamin> +		len = parse_vpd_c0_hp3par(buff, buff_len, str, maxlen);
Benjamin> +	else
Benjamin>  		len = -ENOSYS;
 
Benjamin>  	return len;
Benjamin> @@ -1544,6 +1570,12 @@ scsi_ioctl_pathinfo (struct path * pp, struct config *conf, int mask)
Benjamin>  	if (!(mask & DI_SERIAL))
Benjamin>  		return;
 
Benjamin> +	select_vpd_vendor_pg(conf, pp);
Benjamin> +	select_vpd_vendor_id(conf, pp);
Benjamin> +
Benjamin> +	if (pp->vpd_vendor_pg != 0 && get_vpd_sgio(pp->fd, pp->vpd_vendor_pg, pp->vpd_vendor_id, pp->vpd_data, sizeof(pp->vpd_data)) < 0)
Benjamin> +		condlog(3, "%s: failed to get extra vpd data", pp->dev);
Benjamin> +
Benjamin>  	parent = pp->udev;
Benjamin>  	while (parent) {
Benjamin>  		const char *subsys = udev_device_get_subsystem(parent);
Benjamin> diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
Benjamin> index 16627ec5..1f27450c 100644
Benjamin> --- a/libmultipath/hwtable.c
Benjamin> +++ b/libmultipath/hwtable.c
Benjamin> @@ -117,6 +117,8 @@ static struct hwentry default_hw[] = {
Benjamin>  		.no_path_retry = 18,
Benjamin>  		.fast_io_fail  = 10,
Benjamin>  		.dev_loss      = MAX_DEV_LOSS_TMO,
Benjamin> +		.vpd_vendor_pg = 0xc0,
Benjamin> +		.vpd_vendor_id = VPD_VP_HP3PAR,
Benjamin>  	},
Benjamin>  	{
Benjamin>  		/* RA8000 / ESA12000 */
Benjamin> diff --git a/libmultipath/print.c b/libmultipath/print.c
Benjamin> index 907469ad..0aafe3cb 100644
Benjamin> --- a/libmultipath/print.c
Benjamin> +++ b/libmultipath/print.c
Benjamin> @@ -358,6 +358,23 @@ snprint_action (char * buff, size_t len, const struct multipath * mpp)
Benjamin>  	}
Benjamin>  }
 
Benjamin> +static int
Benjamin> +snprint_multipath_vpd_data(char * buff, size_t len,
Benjamin> +			   const struct multipath * mpp)
Benjamin> +{
Benjamin> +	struct pathgroup * pgp;
Benjamin> +	struct path * pp;
Benjamin> +	int i, j;
Benjamin> +
Benjamin> +	vector_foreach_slot(mpp->pg, pgp, i) {
Benjamin> +		vector_foreach_slot(pgp->paths, pp, j) {
Benjamin> +			if (strlen(pp->vpd_data))
Benjamin> +				return snprintf(buff, len, "%s", pp->vpd_data);
Benjamin> +		}
Benjamin> +	}
Benjamin> +	return 0;
Benjamin> +}
Benjamin> +
Benjamin>  /*
Benjamin>   * path info printing functions
Benjamin>   */
Benjamin> @@ -688,6 +705,14 @@ snprint_path_marginal(char * buff, size_t len, const struct path * pp)
Benjamin>  	return snprintf(buff, len, "normal");
Benjamin>  }
 
Benjamin> +static int
Benjamin> +snprint_path_vpd_data(char * buff, size_t len, const struct path * pp)
Benjamin> +{
Benjamin> +	if (strlen(pp->vpd_data) > 0)
Benjamin> +		return snprintf(buff, len, "%s", pp->vpd_data);
Benjamin> +	return 0;
Benjamin> +}
Benjamin> +
Benjamin>  struct multipath_data mpd[] = {
Benjamin>  	{'n', "name",          0, snprint_name},
Benjamin>  	{'w', "uuid",          0, snprint_multipath_uuid},
Benjamin> @@ -712,6 +737,7 @@ struct multipath_data mpd[] = {
Benjamin>  	{'p', "prod",          0, snprint_multipath_prod},
Benjamin>  	{'e', "rev",           0, snprint_multipath_rev},
Benjamin>  	{'G', "foreign",       0, snprint_multipath_foreign},
Benjamin> +	{'g', "vpd page data", 0, snprint_multipath_vpd_data},
Benjamin>  	{0, NULL, 0 , NULL}
Benjamin>  };
 
Benjamin> @@ -737,6 +763,7 @@ struct path_data pd[] = {
Benjamin>  	{'r', "target WWPN",   0, snprint_tgt_wwpn},
Benjamin>  	{'a', "host adapter",  0, snprint_host_adapter},
Benjamin>  	{'G', "foreign",       0, snprint_path_foreign},
Benjamin> +	{'g', "vpd page data", 0, snprint_path_vpd_data},
Benjamin>  	{'0', "failures",      0, snprint_path_failures},
Benjamin>  	{'P', "protocol",      0, snprint_path_protocol},
Benjamin>  	{0, NULL, 0 , NULL}
Benjamin> diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
Benjamin> index b5b5b89f..3c99f2d4 100644
Benjamin> --- a/libmultipath/propsel.c
Benjamin> +++ b/libmultipath/propsel.c
Benjamin> @@ -1203,3 +1203,27 @@ out:
Benjamin>  		origin);
Benjamin>  	return 0;
Benjamin>  }
Benjamin> +
Benjamin> +int select_vpd_vendor_pg (struct config *conf, struct path *pp)
Benjamin> +{
Benjamin> +	const char *origin;
Benjamin> +
Benjamin> +	pp_set_hwe(vpd_vendor_pg);
Benjamin> +	pp_set_default(vpd_vendor_pg, 0);
Benjamin> +out:
Benjamin> +	condlog(3, "%s: vpd_vendor_pg = 0x%x %s", pp->dev, pp->vpd_vendor_pg,
Benjamin> +		origin);
Benjamin> +	return 0;
Benjamin> +}
Benjamin> +
Benjamin> +int select_vpd_vendor_id (struct config *conf, struct path *pp)
Benjamin> +{
Benjamin> +	const char *origin;
Benjamin> +
Benjamin> +	pp_set_hwe(vpd_vendor_id);
Benjamin> +	pp_set_default(vpd_vendor_id, 0);
Benjamin> +out:
Benjamin> +	condlog(3, "%s: vpd_vendor_id = 0x%x %s", pp->dev, pp->vpd_vendor_id,
Benjamin> +		origin);
Benjamin> +	return 0;
Benjamin> +}
Benjamin> diff --git a/libmultipath/propsel.h b/libmultipath/propsel.h
Benjamin> index ddfd6262..3f6d319a 100644
Benjamin> --- a/libmultipath/propsel.h
Benjamin> +++ b/libmultipath/propsel.h
Benjamin> @@ -37,3 +37,5 @@ void reconcile_features_with_options(const char *id, char **features,
Benjamin>  				     int* no_path_retry,
Benjamin>  				     int *retain_hwhandler);
Benjamin>  int select_all_tg_pt (struct config *conf, struct multipath * mp);
Benjamin> +int select_vpd_vendor_pg (struct config *conf, struct path *pp);
Benjamin> +int select_vpd_vendor_id (struct config *conf, struct path *pp);
Benjamin> diff --git a/libmultipath/structs.h b/libmultipath/structs.h
Benjamin> index 1c32a799..1ad5f64a 100644
Benjamin> --- a/libmultipath/structs.h
Benjamin> +++ b/libmultipath/structs.h
Benjamin> @@ -21,6 +21,7 @@
Benjamin>  #define HOST_NAME_LEN		16
Benjamin>  #define SLOT_NAME_SIZE		40
Benjamin>  #define PRKEY_SIZE		19
Benjamin> +#define VPD_DATA_SIZE		128
 
Benjamin>  #define SCSI_VENDOR_SIZE	9
Benjamin>  #define SCSI_PRODUCT_SIZE	17
Benjamin> @@ -243,6 +244,11 @@ struct hd_geometry {
Benjamin>  };
Benjamin>  #endif
 
Benjamin> +/*
Benjamin> + * from sg_vpd_vendor.c
Benjamin> + */
Benjamin> +#define VPD_VP_HP3PAR 4
Benjamin> +
Benjamin>  struct path {
Benjamin>  	char dev[FILE_NAME_SIZE];
Benjamin>  	char dev_t[BLK_DEV_SIZE];
Benjamin> @@ -255,6 +261,7 @@ struct path {
Benjamin>  	char rev[PATH_REV_SIZE];
Benjamin>  	char serial[SERIAL_SIZE];
Benjamin>  	char tgt_node_name[NODE_NAME_SIZE];
Benjamin> +	char vpd_data[VPD_DATA_SIZE];
Benjamin>  	unsigned long long size;
Benjamin>  	unsigned int checkint;
Benjamin>  	unsigned int tick;
Benjamin> @@ -287,6 +294,8 @@ struct path {
Benjamin>  	int io_err_pathfail_starttime;
Benjamin>  	int find_multipaths_timeout;
Benjamin>  	int marginal;
Benjamin> +	int vpd_vendor_pg;
Benjamin> +	int vpd_vendor_id;
Benjamin>  	/* configlet pointers */
Benjamin>  	vector hwe;
Benjamin>  	struct gen_path generic_path;
Benjamin> diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
Benjamin> index e866da23..dc103fd8 100644
Benjamin> --- a/multipath/multipath.conf.5
Benjamin> +++ b/multipath/multipath.conf.5
Benjamin> @@ -1472,6 +1472,14 @@ the \fIproduct\fR attribute set to the value of \fIproduct_blacklist\fR.
Benjamin>  The user_friendly_names prefix to use for this
Benjamin>  device type, instead of the default "mpath".
Benjamin>  .TP
Benjamin> +.B vpd_vendor
Benjamin> +The vendor specific vpd page information, using the vpd page abbreviation.
Benjamin> +The vpd page abbreviation can be found by running \fIsg_vpd -e\fR. multipathd
Benjamin> +will use this information to gather device specific information that can be
Benjamin> +displayed with the \fI%g\fR wilcard for the \fImultipathd show maps format\fR
Benjamin> +and \fImultipathd show paths format\fR commands. Currently only the
Benjamin> +\fBhp3par\fR vpd page is supported.
Benjamin> +.TP
Benjamin>  .B hardware_handler
Benjamin>  The hardware handler to use for this device type.
Benjamin>  The following hardware handler are implemented:
Benjamin> -- 
Benjamin> 2.17.2

Benjamin> --
Benjamin> dm-devel mailing list
Benjamin> dm-devel@redhat.com
Benjamin> https://www.redhat.com/mailman/listinfo/dm-devel


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

