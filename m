Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AD5BD30C798
	for <lists+dm-devel@lfdr.de>; Tue,  2 Feb 2021 18:26:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612286795;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o+1fgdokK+NltZIkaqabryYHoGys89ran1+lLdKm+dY=;
	b=ZHqFAiah7DmddDiF2UV1h7pdQB1e4GRfxX67OHW2qp/6oV+csxAxaq+1vL+YnKYQUTHT1U
	MfZz1M8uc5Blzc9TtZp8khM2VWls6HrYzH+UuUWoUJqm4ywmDxhUP6UwLADHpFXLMt0uOO
	8tdSmJV9hYREAysIHUJulOhUBthqL6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-JvKmU727OFOqsUvP-oNhbA-1; Tue, 02 Feb 2021 12:26:33 -0500
X-MC-Unique: JvKmU727OFOqsUvP-oNhbA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86571AFA83;
	Tue,  2 Feb 2021 17:26:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A97F25C266;
	Tue,  2 Feb 2021 17:26:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CD2250038;
	Tue,  2 Feb 2021 17:26:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112HOppo019780 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 12:24:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E3F4A5D749; Tue,  2 Feb 2021 17:24:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA9585D722;
	Tue,  2 Feb 2021 17:24:48 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 112HOlJT002025; 
	Tue, 2 Feb 2021 11:24:47 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 112HOkEY002024;
	Tue, 2 Feb 2021 11:24:46 -0600
Date: Tue, 2 Feb 2021 11:24:46 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210202172446.GR15006@octiron.msp.redhat.com>
References: <20210202094312.12948-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210202094312.12948-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 1/3] libmultipath: use 3rd digit as
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 02, 2021 at 10:43:12AM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> On SAS expanders, node id's have 3 digits. sysfs paths look like this:
> 
> /sys/devices/pci0000:80/0000:80:02.0/0000:8b:00.0/0000:8c:09.0/0000:8f:00.0/host9/port-9:0/expander-9:0/port-9:0:13/expander-9:1/port-9:1:12/expander-9:2/port-9:2:4/end_device-9:2:4/target9:0:29/9:0:29:0/block/sdac
> 
> In that case, we should use the last digit as transport id.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/discovery.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index e818585..6d74cc0 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -358,10 +358,17 @@ sysfs_get_tgt_nodename(struct path *pp, char *node)
>  	if (value) {
>  		tgtdev = udev_device_get_parent(parent);
>  		while (tgtdev) {
> +			char c;
> +
>  			tgtname = udev_device_get_sysname(tgtdev);
> -			if (tgtname && sscanf(tgtname, "end_device-%d:%d",
> -				   &host, &tgtid) == 2)
> -				break;
> +			if (tgtname) {
> +				if (sscanf(tgtname, "end_device-%d:%d:%d%c",
> +					   &host, &channel, &tgtid, &c) == 3)
> +					break;
> +				if (sscanf(tgtname, "end_device-%d:%d%c",
> +					   &host, &tgtid, &c) == 2)
> +					break;
> +			}
>  			tgtdev = udev_device_get_parent(tgtdev);
>  			tgtid = -1;
>  		}
> -- 
> 2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

