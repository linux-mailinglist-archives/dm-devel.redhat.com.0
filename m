Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E59F430E34D
	for <lists+dm-devel@lfdr.de>; Wed,  3 Feb 2021 20:31:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612380701;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U+4mi27xrV9eo2EziflWVLuqse4Wj3L9zxWIRu96HE0=;
	b=gd5Vl87LUJMR5ICm6wtd4SUeamdXbiq9/oGNTSj4ByvTDWJU98T/jz/JqKRByW6GTzfQkE
	TmMb/VK+qNf+ex+LgnG0yWKALhp7+W1qSyqK9HJWfD112/buzFjq4RqRDiYKq11owS971W
	tBW0JCw0EEG0hdL/LZkE7B1wOUgBKgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-feaTQUqhNQe6U-2CqwIVQA-1; Wed, 03 Feb 2021 14:31:38 -0500
X-MC-Unique: feaTQUqhNQe6U-2CqwIVQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C19B192AB9E;
	Wed,  3 Feb 2021 19:31:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2EE577BE9;
	Wed,  3 Feb 2021 19:31:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 448F057DFA;
	Wed,  3 Feb 2021 19:31:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113JUxPc005438 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 14:30:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 19026722C6; Wed,  3 Feb 2021 19:30:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 317F450DE3;
	Wed,  3 Feb 2021 19:30:55 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 113JUr6I021179; 
	Wed, 3 Feb 2021 13:30:53 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 113JUqw3021178;
	Wed, 3 Feb 2021 13:30:52 -0600
Date: Wed, 3 Feb 2021 13:30:52 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210203193052.GA15006@octiron.msp.redhat.com>
References: <20210202214131.19901-1-mwilck@suse.com>
	<20210202214131.19901-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210202214131.19901-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/3] multipathd: ev_add_path: fail if
 add_map_with_path() fails
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

On Tue, Feb 02, 2021 at 10:41:30PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> If start_waiter was set before and the "rescan" label was used,
> we may try to set up an empty/invalid map.
> Always fail if add_map_with_path() isn't successful.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>

This patch looks fine, but I don't think that there was any risk before.
I don't see how you could loop back to rescan with mpp == NULL, which
is what would need to happen before you could ever run this code.
At any rate

Reviewed-by: Benjamin Marzinski <bmarzin@redhat.com>
> ---
>  multipathd/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 43d7768..425492a 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -1028,7 +1028,7 @@ rescan:
>  			 */
>  			start_waiter = 1;
>  		}
> -		if (!start_waiter)
> +		else
>  			goto fail; /* leave path added to pathvec */
>  	}
>  
> -- 
> 2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

