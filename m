Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1A1446B19
	for <lists+dm-devel@lfdr.de>; Sat,  6 Nov 2021 00:04:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636153483;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N5OzgJXXGcBRmfDY8CBwo9YN7P24mqWCZaMa6Di9/H8=;
	b=WSSirmjZTMsQsjSJVD3z82j78/drOX3jTKyXeZfIqmgQWUZNts2PgyS/gmQ51kKnP60+PE
	eKoh+6An578L+aoVMZktyVxTqZkwic7LXP8rmEZVJ7yeR3Qt+ymagICOLE3JXZnQtBo+Ry
	o1Nl9RJq8G7YjADoBUZnbUGCVFXQcEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-7lWCZ8ISNO6lCUx9Es8nDA-1; Fri, 05 Nov 2021 19:04:42 -0400
X-MC-Unique: 7lWCZ8ISNO6lCUx9Es8nDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69DE28042E0;
	Fri,  5 Nov 2021 23:04:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E078179455;
	Fri,  5 Nov 2021 23:04:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE3621806D03;
	Fri,  5 Nov 2021 23:04:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A5N4MT4002299 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Nov 2021 19:04:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2833E1815D; Fri,  5 Nov 2021 23:04:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77BF7ADD9;
	Fri,  5 Nov 2021 23:04:18 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1A5N4Gh7013251; 
	Fri, 5 Nov 2021 18:04:16 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1A5N4F6B013250;
	Fri, 5 Nov 2021 18:04:15 -0500
Date: Fri, 5 Nov 2021 18:04:15 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20211105230415.GQ19591@octiron.msp.redhat.com>
References: <20211105110312.19567-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20211105110312.19567-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: add path wildcard "%I" for
	init state
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 05, 2021 at 12:03:12PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> Enable printing pp->initialized with 'multipathd show paths format "%I"'.
> This is supposed to go on top of Ben's "multipathd: remove udev settle 
> dependency" series, to simplify checking multipathd's state.
> 
> ---
>  libmultipath/print.c   | 21 +++++++++++++++++++++
>  libmultipath/structs.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/libmultipath/print.c b/libmultipath/print.c
> index 2fb9f4e..b5b9905 100644
> --- a/libmultipath/print.c
> +++ b/libmultipath/print.c
> @@ -504,6 +504,26 @@ snprint_dm_path_state (struct strbuf *buff, const struct path * pp)
>  	}
>  }
>  
> +static int snprint_initialized(struct strbuf *buff, const struct path * pp)
> +{
> +	static const char *init_state_name[] = {
> +		[INIT_NEW] = "new",
> +		[INIT_FAILED] = "failed",
> +		[INIT_MISSING_UDEV] = "udev-missing",
> +		[INIT_REQUESTED_UDEV] = "udev-requested",
> +		[INIT_OK] = "ok",
> +		[INIT_REMOVED] = "removed",
> +		[INIT_PARTIAL] = "partial",
> +	};
> +	const char *str;
> +
> +	if (pp->initialized < INIT_NEW || pp->initialized >= __INIT_LAST)
> +		str = "undef";
> +	else
> +		str = init_state_name[pp->initialized];
> +	return append_strbuf_str(buff, str);
> +}
> +
>  static int
>  snprint_vpr (struct strbuf *buff, const struct path * pp)
>  {
> @@ -804,6 +824,7 @@ struct path_data pd[] = {
>  	{'g', "vpd page data", 0, snprint_path_vpd_data},
>  	{'0', "failures",      0, snprint_path_failures},
>  	{'P', "protocol",      0, snprint_path_protocol},
> +	{'I', "init_st",       0, snprint_initialized},
>  	{0, NULL, 0 , NULL}
>  };
>  
> diff --git a/libmultipath/structs.h b/libmultipath/structs.h
> index 69409fd..d8c24b5 100644
> --- a/libmultipath/structs.h
> +++ b/libmultipath/structs.h
> @@ -206,6 +206,7 @@ enum initialized_states {
>  	 * change uevent is received.
>  	 */
>  	INIT_PARTIAL,
> +	__INIT_LAST,
>  };
>  
>  enum prkey_sources {
> -- 
> 2.33.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

