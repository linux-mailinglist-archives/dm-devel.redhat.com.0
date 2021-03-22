Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 586E9344781
	for <lists+dm-devel@lfdr.de>; Mon, 22 Mar 2021 15:38:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616423927;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AUIVkvb9+dc0kP6hAaLlYP4b4ELSWf9Upu4cdczoNDw=;
	b=CHD+PUuavwB4CFdNol05hVywCF4cU+b4akWM7BY1urCdK15+zEvn8nfWuCvyCeAVyCqqhR
	kXuzDYNLVht/gprOQV/jAsUDoH8PNJpsK3aHoG1nsJjcAVADN82AU4GWE+6Ead6L89C1d/
	fXYWiwSj7Jq0qC/fZoDrWTbOFWhXGgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-wb-dp9V1PraeKVXrXmBuZQ-1; Mon, 22 Mar 2021 10:38:45 -0400
X-MC-Unique: wb-dp9V1PraeKVXrXmBuZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91421107B769;
	Mon, 22 Mar 2021 14:38:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B14160936;
	Mon, 22 Mar 2021 14:38:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 991674BB7C;
	Mon, 22 Mar 2021 14:38:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12MEbi5p032504 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Mar 2021 10:37:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDDCD5B6AB; Mon, 22 Mar 2021 14:37:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98E165B6A8;
	Mon, 22 Mar 2021 14:37:41 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 12MEbdcG012746; 
	Mon, 22 Mar 2021 09:37:40 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 12MEbdVV012745;
	Mon, 22 Mar 2021 09:37:39 -0500
Date: Mon, 22 Mar 2021 09:37:39 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210322143739.GD15006@octiron.msp.redhat.com>
References: <20210319162647.25240-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210319162647.25240-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] Revert "multipath -U: reduce log level of
 "adding new path" message"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 19, 2021 at 05:26:47PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> After "11-dm-mpath.rules: run "multipath -U" with -v1", this patch isn't
> necessary any more. It's desirable to see these messages from multipathd,
> as they mean that a valid path had been found in a map that wasn't present
> in the udev db.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

And I'm fine with you rebasing the queue branch.

> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
> If this is approved, unless anyone objects, I'll simply drop the patch
> that this reverts in the "queue" branch, performing a rebase.
> 
> ---
>  libmultipath/structs_vec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 0b069f4..d242c06 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -192,7 +192,7 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
>  						must_reload = true;
>  						continue;
>  					}
> -					condlog(3, "%s: adding new path %s",
> +					condlog(2, "%s: adding new path %s",
>  						mpp->alias, pp->dev);
>  					store_path(pathvec, pp);
>  					pp->tick = 1;
> -- 
> 2.30.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

