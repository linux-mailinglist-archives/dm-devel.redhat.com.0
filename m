Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BE4C930B52F
	for <lists+dm-devel@lfdr.de>; Tue,  2 Feb 2021 03:23:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612232579;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Od4kS2A5k8+v+V6VHIwCsMCrvPO/obH2pqVU7lX+3ZE=;
	b=GIJplF+gE8/gQOkM6w5R7XvMId2RiPqy1l5Thonj2C8wJU1pS+1EB8tJdiQ362TLb8Ph3b
	lRB152GHMmay0d7a6Qsg1ma4y6FAVE/ZkNyi6vXDqKkA9lXQzFeyNK+vuMVbVEVWaBq2pS
	UgIdi8hAO7/D11aWKDWVk8vSs+t3s2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-g49XitWMNECMLh0_Sfb17A-1; Mon, 01 Feb 2021 21:22:57 -0500
X-MC-Unique: g49XitWMNECMLh0_Sfb17A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A81C18C89C4;
	Tue,  2 Feb 2021 02:22:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B2FB60BF3;
	Tue,  2 Feb 2021 02:22:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6062E1809C9F;
	Tue,  2 Feb 2021 02:22:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1122MK8s018513 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Feb 2021 21:22:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D0956F920; Tue,  2 Feb 2021 02:22:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14FD539A50;
	Tue,  2 Feb 2021 02:22:17 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1122MFFw024960; 
	Mon, 1 Feb 2021 20:22:15 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1122ME9Z024959;
	Mon, 1 Feb 2021 20:22:14 -0600
Date: Mon, 1 Feb 2021 20:22:14 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210202022214.GL15006@octiron.msp.redhat.com>
References: <20210128204544.18563-1-mwilck@suse.com>
	<20210128204544.18563-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210128204544.18563-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/3] libmultipath: use 3rd digit as
 transport_id for expanders
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 28, 2021 at 09:45:42PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> On SAS expanders, node id's have 3 digits. sysfs paths look like this:
> 
> /sys/devices/pci0000:80/0000:80:02.0/0000:8b:00.0/0000:8c:09.0/0000:8f:00.0/host9/port-9:0/expander-9:0/port-9:0:13/expander-9:1/port-9:1:12/expander-9:2/port-9:2:4/end_device-9:2:4/target9:0:29/9:0:29:0/block/sdac
> 
> In that case, we should use the last digit as transport id.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/discovery.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index e818585..f3ce3f8 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -358,9 +358,16 @@ sysfs_get_tgt_nodename(struct path *pp, char *node)
>  	if (value) {
>  		tgtdev = udev_device_get_parent(parent);
>  		while (tgtdev) {
> +			char c;
> +
>  			tgtname = udev_device_get_sysname(tgtdev);
> -			if (tgtname && sscanf(tgtname, "end_device-%d:%d",
> -				   &host, &tgtid) == 2)
> +			if (!tgtname)
> +				continue;

won't this make and endless loop if tgtname == NULL

-Ben

> +			if (sscanf(tgtname, "end_device-%d:%d:%d%c",
> +				   &host, &channel, &tgtid, &c) == 3)
> +				break;
> +			if (sscanf(tgtname, "end_device-%d:%d%c",
> +				   &host, &tgtid, &c) == 2)
>  				break;
>  			tgtdev = udev_device_get_parent(tgtdev);
>  			tgtid = -1;
> -- 
> 2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

