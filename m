Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 41522224F99
	for <lists+dm-devel@lfdr.de>; Sun, 19 Jul 2020 07:07:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595135269;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SqI4NMna0FzEEf+g9bHta1Gdm2BGfOdYwacDX2sRqdo=;
	b=bXddYlOPs1/PCYgT7mA7Q4vOFoyQfSbu7pLHiny/yQ2f1Wv27HaguO9XPesao8Cu2TBQik
	XRFv+CPJamhVjLFJar5WaoOlZGBhu9iwJwYJ6ppZnQMRjhtzh8+DCHCBZABo38hzMDb0RL
	I0fL9KdbQDRxL/Ii23TjKL19Tu/pi8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-l16hpf5NOz-dPomfh_Wfyg-1; Sun, 19 Jul 2020 01:07:46 -0400
X-MC-Unique: l16hpf5NOz-dPomfh_Wfyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 444F318A1DE9;
	Sun, 19 Jul 2020 05:07:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9E392DE6F;
	Sun, 19 Jul 2020 05:07:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFB4094EE2;
	Sun, 19 Jul 2020 05:07:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06J57MGo017975 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 Jul 2020 01:07:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0651510023A6; Sun, 19 Jul 2020 05:07:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 258EF100238C;
	Sun, 19 Jul 2020 05:07:19 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06J57H1O007140; 
	Sun, 19 Jul 2020 00:07:17 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06J57HM7007139;
	Sun, 19 Jul 2020 00:07:17 -0500
Date: Sun, 19 Jul 2020 00:07:16 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200719050716.GW11089@octiron.msp.redhat.com>
References: <20200709105145.9211-1-mwilck@suse.com>
	<20200709105145.9211-12-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709105145.9211-12-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 64/74] multipathd: check_path(): set
 retrigger_delay if necessary
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:51:35PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> In a follow up patch, we will set INIT_MISSING_UDEV and set tick=1
> (minimal) at the same time. In this case, which is new, check_path()
> must reset the delay when it first triggers an uevent.

Maybe I'm just being obtuse here, but I don't get what this does.
pp->tick will always be 0 for any path that makes it to the check

if (!pp->mpp && pp->initialized == INIT_MISSING_UDEV) {

And then if it's not out of retries, the path will get set to
INIT_REQUESTED_UDEV, and pathinfo() will take care of resetting pp->tick
when it gets called by the new uevent.

If it is out of retries, the path won't get pp->tick reset, which seems
wrong, but it that case it should probably be set to max_checkint, like
happens when the "add missing paths" code fails.

Or like I said, maybe I'm just missing something.
-Ben

> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/main.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 7b2d320..0cd0ee6 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -2019,6 +2019,7 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
>  	int disable_reinstate = 0;
>  	int oldchkrstate = pp->chkrstate;
>  	int retrigger_tries, verbosity;
> +	unsigned int retrigger_delay;
>  	unsigned int checkint, max_checkint;
>  	struct config *conf;
>  	int marginal_pathgroups, marginal_changed = 0;
> @@ -2036,6 +2037,7 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
>  
>  	conf = get_multipath_config();
>  	retrigger_tries = conf->retrigger_tries;
> +	retrigger_delay = conf->retrigger_delay;
>  	checkint = conf->checkint;
>  	max_checkint = conf->max_checkint;
>  	verbosity = conf->verbosity;
> @@ -2048,6 +2050,8 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
>  	};
>  
>  	if (!pp->mpp && pp->initialized == INIT_MISSING_UDEV) {
> +		if (pp->tick != retrigger_delay)
> +			pp->tick = conf->retrigger_delay;
>  		if (pp->retriggers < retrigger_tries) {
>  			condlog(2, "%s: triggering change event to reinitialize",
>  				pp->dev);
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

