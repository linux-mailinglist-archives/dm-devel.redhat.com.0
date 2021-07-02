Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5119F3BA36E
	for <lists+dm-devel@lfdr.de>; Fri,  2 Jul 2021 18:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625245198;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8zC+tshQ6hVR6ZqENI1vpQeOhPFrtYQsWFtwJlo+7+w=;
	b=IZAdsh6Ku3wBexew1niSM7Ol9eM3jbaDYORXbUEWJUsAMCzP69113mz8JmYtfVRX869C2J
	NgVxrWKdbvG84qZ6JIHHBtpTUdCOuqlfJJyTohN/sAwRHW1HutRO/SQsU0k7xNZ8lm3D/w
	pDWy+7ahIZxIk3abI+GdYjUUU5Ite+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-m797WWIjOQGf2u1NnoTAXA-1; Fri, 02 Jul 2021 12:59:56 -0400
X-MC-Unique: m797WWIjOQGf2u1NnoTAXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F38841926DAA;
	Fri,  2 Jul 2021 16:59:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B72981346F;
	Fri,  2 Jul 2021 16:59:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBA8F4EA2A;
	Fri,  2 Jul 2021 16:59:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 162GvhOG018520 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Jul 2021 12:57:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 62CD960E3A; Fri,  2 Jul 2021 16:57:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D56B60C13;
	Fri,  2 Jul 2021 16:57:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 162GvaP1014125; 
	Fri, 2 Jul 2021 11:57:36 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 162GvZis014124;
	Fri, 2 Jul 2021 11:57:35 -0500
Date: Fri, 2 Jul 2021 11:57:35 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210702165735.GC22969@octiron.msp.redhat.com>
References: <20210630200135.8423-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210630200135.8423-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: use uint64_t for sg_id.lun
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 30, 2021 at 10:01:35PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> SCSI LUNs are 64bit unsigned integers, and have been exposed as such by
> the kernel for years. Storage using the full 8 bytes is fortunately rare.
> Still, we should handle this properly.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/discovery.c                 | 10 +++++-----
>  libmultipath/print.c                     |  2 +-
>  libmultipath/prioritizers/weightedpath.c |  2 +-
>  libmultipath/structs.c                   |  2 +-
>  libmultipath/structs.h                   |  4 +++-
>  5 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index bfe2f56..e9f5703 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -1427,7 +1427,7 @@ scsi_sysfs_pathinfo (struct path *pp, const struct _vector *hwtable)
>  			attr_path = udev_device_get_sysname(parent);
>  			if (!attr_path)
>  				break;
> -			if (sscanf(attr_path, "%i:%i:%i:%i",
> +			if (sscanf(attr_path, "%i:%i:%i:%" SCNu64,
>  				   &pp->sg_id.host_no,
>  				   &pp->sg_id.channel,
>  				   &pp->sg_id.scsi_id,
> @@ -1462,7 +1462,7 @@ scsi_sysfs_pathinfo (struct path *pp, const struct _vector *hwtable)
>  	/*
>  	 * host / bus / target / lun
>  	 */
> -	condlog(3, "%s: h:b:t:l = %i:%i:%i:%i",
> +	condlog(3, "%s: h:b:t:l = %i:%i:%i:%" PRIu64,
>  			pp->dev,
>  			pp->sg_id.host_no,
>  			pp->sg_id.channel,
> @@ -1577,7 +1577,7 @@ ccw_sysfs_pathinfo (struct path *pp, const struct _vector *hwtable)
>  		   &pp->sg_id.host_no,
>  		   &pp->sg_id.channel,
>  		   &pp->sg_id.scsi_id) == 3) {
> -		condlog(3, "%s: h:b:t:l = %i:%i:%i:%i",
> +		condlog(3, "%s: h:b:t:l = %i:%i:%i:%" PRIu64,
>  			pp->dev,
>  			pp->sg_id.host_no,
>  			pp->sg_id.channel,
> @@ -1636,7 +1636,7 @@ cciss_sysfs_pathinfo (struct path *pp, const struct _vector *hwtable)
>  	 */
>  	pp->sg_id.lun = 0;
>  	pp->sg_id.channel = 0;
> -	condlog(3, "%s: h:b:t:l = %i:%i:%i:%i",
> +	condlog(3, "%s: h:b:t:l = %i:%i:%i:%" PRIu64,
>  		pp->dev,
>  		pp->sg_id.host_no,
>  		pp->sg_id.channel,
> @@ -1815,7 +1815,7 @@ scsi_ioctl_pathinfo (struct path * pp, int mask)
>  			attr_path = udev_device_get_sysname(parent);
>  			if (!attr_path)
>  				break;
> -			if (sscanf(attr_path, "%i:%i:%i:%i",
> +			if (sscanf(attr_path, "%i:%i:%i:%" SCNu64,
>  				   &pp->sg_id.host_no,
>  				   &pp->sg_id.channel,
>  				   &pp->sg_id.scsi_id,
> diff --git a/libmultipath/print.c b/libmultipath/print.c
> index 3c69bf4..29ce499 100644
> --- a/libmultipath/print.c
> +++ b/libmultipath/print.c
> @@ -392,7 +392,7 @@ snprint_hcil (char * buff, size_t len, const struct path * pp)
>  	if (!pp || pp->sg_id.host_no < 0)
>  		return snprintf(buff, len, "#:#:#:#");
>  
> -	return snprintf(buff, len, "%i:%i:%i:%i",
> +	return snprintf(buff, len, "%i:%i:%i:%" PRIu64,
>  			pp->sg_id.host_no,
>  			pp->sg_id.channel,
>  			pp->sg_id.scsi_id,
> diff --git a/libmultipath/prioritizers/weightedpath.c b/libmultipath/prioritizers/weightedpath.c
> index 916970d..650088b 100644
> --- a/libmultipath/prioritizers/weightedpath.c
> +++ b/libmultipath/prioritizers/weightedpath.c
> @@ -101,7 +101,7 @@ int prio_path_weight(struct path *pp, char *prio_args)
>  	}
>  
>  	if (!strcmp(regex, HBTL)) {
> -		sprintf(path, "%d:%d:%d:%d", pp->sg_id.host_no,
> +		sprintf(path, "%d:%d:%d:%" PRIu64, pp->sg_id.host_no,
>  			pp->sg_id.channel, pp->sg_id.scsi_id, pp->sg_id.lun);
>  	} else if (!strcmp(regex, DEV_NAME)) {
>  		strcpy(path, pp->dev);
> diff --git a/libmultipath/structs.c b/libmultipath/structs.c
> index 8751fc2..6e5a103 100644
> --- a/libmultipath/structs.c
> +++ b/libmultipath/structs.c
> @@ -96,7 +96,7 @@ alloc_path (void)
>  		pp->sg_id.host_no = -1;
>  		pp->sg_id.channel = -1;
>  		pp->sg_id.scsi_id = -1;
> -		pp->sg_id.lun = -1;
> +		pp->sg_id.lun = SCSI_INVALID_LUN;
>  		pp->sg_id.proto_id = SCSI_PROTOCOL_UNSPEC;
>  		pp->fd = -1;
>  		pp->tpgs = TPGS_UNDEF;
> diff --git a/libmultipath/structs.h b/libmultipath/structs.h
> index c8447e5..c52bcee 100644
> --- a/libmultipath/structs.h
> +++ b/libmultipath/structs.h
> @@ -178,6 +178,8 @@ enum scsi_protocol {
>  	SCSI_PROTOCOL_UNSPEC = 0xf, /* No specific protocol */
>  };
>  
> +#define SCSI_INVALID_LUN ~0ULL
> +
>  enum no_undef_states {
>  	NU_NO = -1,
>  	NU_UNDEF = 0,
> @@ -258,7 +260,7 @@ struct sg_id {
>  	int host_no;
>  	int channel;
>  	int scsi_id;
> -	int lun;
> +	uint64_t lun;
>  	short h_cmd_per_lun;
>  	short d_queue_depth;
>  	enum scsi_protocol proto_id;
> -- 
> 2.32.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

