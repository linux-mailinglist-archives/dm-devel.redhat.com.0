Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 385BA40D36F
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 08:51:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631775063;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/8HElSBlMd/IwaBwyvCuJuUc1GLWR5yBXXRe8gtl0yI=;
	b=TivCYK0C5BjxhrBNWlxxEE9dMiZ2qB4lN7986ISgODXxwny17Oj9zNIrlhzWUysIxWq6xe
	E1KXaAEScjaxQ71BGyTB0qGIE/U03hRQV5QsxBXIwvqs7fX1vFArDGk4j5Ucs8MwimH85g
	ZgcLMnLpeqiALFQPo9gks4SHxN+WBs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-iEMlPtMcPcytQFL4iVTayQ-1; Thu, 16 Sep 2021 02:50:31 -0400
X-MC-Unique: iEMlPtMcPcytQFL4iVTayQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0D9E10144E0;
	Thu, 16 Sep 2021 06:50:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AE245D9F4;
	Thu, 16 Sep 2021 06:50:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18834180142F;
	Thu, 16 Sep 2021 06:50:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18FMtP9A010991 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 18:55:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54A4F18AD4; Wed, 15 Sep 2021 22:55:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1873604CC;
	Wed, 15 Sep 2021 22:55:21 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18FMtJUt006409; 
	Wed, 15 Sep 2021 17:55:20 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18FMtJQB006408;
	Wed, 15 Sep 2021 17:55:19 -0500
Date: Wed, 15 Sep 2021 17:55:18 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210915225518.GR3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-7-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-7-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 16 Sep 2021 02:50:07 -0400
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 06/35] multipathd: fix systemd notification
 when stopping while reloading
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:40:51PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> After sending "RELOADING=1" to systemd, a service must send
> "READY=1" before "STOPPING=1". Otherwise systemd will be confused
> and will not regard the service as stopped. Subsequent attempts
> to start multipathd via socket activation fail until systemd times
> out the reload operation.
> 
> The problem can be reproduced by running "multipathd shutdown"
> quickly after "multipathd reconfigure".
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/main.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 3aff241..67160b9 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -210,9 +210,12 @@ static void do_sd_notify(enum daemon_status old_state,
>  	if (msg && !safe_sprintf(notify_msg, "STATUS=%s", msg))
>  		sd_notify(0, notify_msg);
>  
> -	if (new_state == DAEMON_SHUTDOWN)
> +	if (new_state == DAEMON_SHUTDOWN) {
> +		/* Tell systemd that we're not RELOADING any more */
> +		if (old_state == DAEMON_CONFIGURE && startup_done)
> +			sd_notify(0, "READY=1");
>  		sd_notify(0, "STOPPING=1");
> -	else if (new_state == DAEMON_IDLE && old_state == DAEMON_CONFIGURE) {
> +	} else if (new_state == DAEMON_IDLE && old_state == DAEMON_CONFIGURE) {
>  		sd_notify(0, "READY=1");
>  		startup_done = true;
>  	} else if (new_state == DAEMON_CONFIGURE && startup_done)
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

