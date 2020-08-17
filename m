Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1A52479F8
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 00:08:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597702082;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XqCJJIe6KJpSyJ6CgC516oEg8EckezJ6Eb8WH+Y0dbw=;
	b=UwgcQf/2JBY+OyXOJfiT2PYSm9UeIv7bUwpBA+F5T33Qveqcy/0cFT23bBMsFjnlpfKUDP
	kM2lsWf6JNbF1RnwBZihXt3WjuzvoqnjUECcUHu2wET6RMWb9PICN2yMLuMBaxHl3UNxkz
	BxzlAc63NoLbCRDsqC5pC52CWYX923g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-oCkl4TC2Ns2B9VSojnOhdA-1; Mon, 17 Aug 2020 18:07:59 -0400
X-MC-Unique: oCkl4TC2Ns2B9VSojnOhdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCED981F00B;
	Mon, 17 Aug 2020 22:07:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3DCA19C4F;
	Mon, 17 Aug 2020 22:07:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A97DA1826D29;
	Mon, 17 Aug 2020 22:07:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HM5h1q016330 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 18:05:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D265E19C4F; Mon, 17 Aug 2020 22:05:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C862521E9B;
	Mon, 17 Aug 2020 22:05:40 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07HM5db7023472; 
	Mon, 17 Aug 2020 17:05:39 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07HM5cA0023471;
	Mon, 17 Aug 2020 17:05:38 -0500
Date: Mon, 17 Aug 2020 17:05:38 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200817220538.GK19233@octiron.msp.redhat.com>
References: <20200812113601.26658-1-mwilck@suse.com>
	<20200812113601.26658-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113601.26658-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Zhiqiang Liu <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH v2 82/84] libmultipath: free pp if store_path
 fails in disassemble_map
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 12, 2020 at 01:35:59PM +0200, mwilck@suse.com wrote:
> From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> 
> In disassemble_map func, one pp will be allocated and stored in
> pgp->paths. However, if store_path fails, pp will not be freed,
> then memory leak problem occurs.
> 
> Here, we will call free_path to free pp when store_path fails.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/dmparser.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> index 25e6a4a..c103161 100644
> --- a/libmultipath/dmparser.c
> +++ b/libmultipath/dmparser.c
> @@ -306,11 +306,15 @@ int disassemble_map(const struct _vector *pathvec,
>  					goto out1;
>  
>  				strlcpy(pp->dev_t, word, BLK_DEV_SIZE);
> -			}
> -			FREE(word);
>  
> -			if (store_path(pgp->paths, pp))
> -				goto out;
> +				if (store_path(pgp->paths, pp)) {
> +					free_path(pp);
> +					goto out1;
> +				}
> +			} else if (store_path(pgp->paths, pp))
> +				goto out1;
> +
> +			FREE(word);
>  
>  			pgp->id ^= (long)pp;
>  			pp->pgindex = i + 1;
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

