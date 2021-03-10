Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 75AE83347F8
	for <lists+dm-devel@lfdr.de>; Wed, 10 Mar 2021 20:31:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615404704;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3YsQ7Y6zmPopAgGdy1LM2TXm5ruTBGx3SZrpJEQsyoI=;
	b=E3vfmC/b6fLQneG3zN1Rpw1fS9k2s55y0Y6noegJeMO4WoBOn2disFm49xyAzNk3GnyKPO
	VhO9j2yD+ZKCwNfdb5+VGb4Veiclp2kIxn5/pX0a63i8VwkIFS/XE0h7s5Q3gxwRs6U8aI
	cQhWFTWM+mMFGGYrqU0+RPXzCYm/36c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-Nkr3Tq65MW2-cDNPxiFk-Q-1; Wed, 10 Mar 2021 14:31:42 -0500
X-MC-Unique: Nkr3Tq65MW2-cDNPxiFk-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E75332F7B7;
	Wed, 10 Mar 2021 19:31:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 046A860C13;
	Wed, 10 Mar 2021 19:31:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67F4E57DC2;
	Wed, 10 Mar 2021 19:31:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12AJVBa0005834 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Mar 2021 14:31:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2A98B17B73; Wed, 10 Mar 2021 19:31:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DFCF5D6D7;
	Wed, 10 Mar 2021 19:31:01 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 12AJUxZ2009461; 
	Wed, 10 Mar 2021 13:30:59 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 12AJUwkE009458;
	Wed, 10 Mar 2021 13:30:58 -0600
Date: Wed, 10 Mar 2021 13:30:58 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210310193058.GT15006@octiron.msp.redhat.com>
References: <20210310101538.25289-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210310101538.25289-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipath -U: reduce log level of "adding
 new path" message
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 10, 2021 at 11:15:38AM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The message
> 
>     3600a098000aad73f00000a3f5a275dc8: adding new path sdc
> 
> was meant to warn users in cases where multipathd hadn't obtained
> information about a path device from udev, and found it later
> in some multipath map. In regular operation, this may indicate
> a problem with the udev db, stuck udev workers, or some race
> between udev and multipathd. It could also be a normal situation,
> e.g. after switching from the initrd to the root FS.
> 
> However, there's one mode of operation where this situation is normal:
> the "check usable paths" mode (-C/-U). For performance reasons, multipath
> doesn't do a full path discovery in this mode. It just reads the given
> map. Thus encountering paths which aren't in pathvec is totally normal,
> and will cause the above message for every path on every uevent for
> a multipath device, which is highly confusing for users.
> 
> Reduce the log level of this message to 3. I think that's sufficient.
> The reason I'd set it originall to level 2 was mainly that when I
> worked on that code, I really didn't want to miss any of these messages.
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/structs_vec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 47b1d03..57cd88a 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -192,7 +192,7 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
>  						must_reload = true;
>  						continue;
>  					}
> -					condlog(2, "%s: adding new path %s",
> +					condlog(3, "%s: adding new path %s",
>  						mpp->alias, pp->dev);
>  					store_path(pathvec, pp);
>  					pp->tick = 1;
> -- 
> 2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

