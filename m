Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B696D30B624
	for <lists+dm-devel@lfdr.de>; Tue,  2 Feb 2021 05:01:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612238494;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LeCotM3MKRLNrC5v9Ne6hyKqlNicZCsy64so2+AE0/w=;
	b=IvRd1RKgbuSj6DPNyvcZjQxk3YLaM/iKpfw+qYbwqxATWkXugy6IKihIWhtH0BZWYVIU2m
	FLOcMbsih61emKoMzkr5pv82koyfNfQDQXxAXieJrz4N5EwbrOF6zHJaRhs+KtGlYW8AS4
	lXEhTDqZ7qppy2jTXZTVxwSZcM72GgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-KxXv4W7FP6mXSY2UYvUAKg-1; Mon, 01 Feb 2021 23:01:32 -0500
X-MC-Unique: KxXv4W7FP6mXSY2UYvUAKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EEAA80ED8B;
	Tue,  2 Feb 2021 04:01:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77E5A614FC;
	Tue,  2 Feb 2021 04:01:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B991180954D;
	Tue,  2 Feb 2021 04:01:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11240QfJ027432 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Feb 2021 23:00:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F268D1D7; Tue,  2 Feb 2021 04:00:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 049B227C24;
	Tue,  2 Feb 2021 04:00:22 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 11240LOl025373; 
	Mon, 1 Feb 2021 22:00:21 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 11240KnT025372;
	Mon, 1 Feb 2021 22:00:20 -0600
Date: Mon, 1 Feb 2021 22:00:20 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210202040020.GN15006@octiron.msp.redhat.com>
References: <20210128204544.18563-1-mwilck@suse.com>
	<20210128204544.18563-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210128204544.18563-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/3] libmultipath:
 sysfs_set_nexus_loss_tmo(): support SAS expanders
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 28, 2021 at 09:45:43PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> With SAS expanders, SAS node names have 3 digits. libmultipath
> would fail to discover the sas_end_device matching a given SCSI
> target in this case. Fix it.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/discovery.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index f3ce3f8..7878454 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -789,14 +789,28 @@ sysfs_set_session_tmo(struct multipath *mpp, struct path *pp)
>  static void
>  sysfs_set_nexus_loss_tmo(struct multipath *mpp, struct path *pp)
>  {
> -	struct udev_device *sas_dev = NULL;
> -	char end_dev_id[64];
> +	struct udev_device *parent, *sas_dev = NULL;
> +	const char *end_dev_id = NULL;
>  	char value[11];
> +	static const char ed_str[] = "end_device-";
>  
> -	if (mpp->dev_loss == DEV_LOSS_TMO_UNSET)
> +	if (!pp->udev || mpp->dev_loss == DEV_LOSS_TMO_UNSET)
>  		return;
> -	sprintf(end_dev_id, "end_device-%d:%d",
> -		pp->sg_id.host_no, pp->sg_id.transport_id);
> +
> +	for (parent = udev_device_get_parent(pp->udev);
> +	     parent;
> +	     parent = udev_device_get_parent(parent)) {
> +		const char *ed = udev_device_get_sysname(parent);
> +
> +		if (!strncmp(ed, ed_str, sizeof(ed_str) - 1)) {
> +			end_dev_id = ed;
> +			break;
> +		}
> +	}
> +	if (!end_dev_id) {
> +		condlog(1, "%s: No SAS end device", pp->dev);
> +		return;
> +	}
>  	sas_dev = udev_device_new_from_subsystem_sysname(udev,
>  				"sas_end_device", end_dev_id);
>  	if (!sas_dev) {
> -- 
> 2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

