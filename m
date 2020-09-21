Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BEB8A273388
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 22:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600719363;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ElhaMb8o1Zh8lY7mXe5NoRmfgObN+Ftz3P1Ib42IJfs=;
	b=QprA28IOyhKUgcM/DW8D+7QF9ebFfr+Xp+QVEPPrSUf9RLpuKjHy/AtJXk7CfdJY0d27TF
	GYEseFHcHr+UucOdG7VnLbt4t0oYIRnec2XvQbsvqxjTs2xXCfoW/ITQJ0sLNafhXLgqO4
	ylocDDISRp2u0w/Z9G5W7lx2t5EsNFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-ObAelVHIN8qiiml6qn4qqA-1; Mon, 21 Sep 2020 16:16:01 -0400
X-MC-Unique: ObAelVHIN8qiiml6qn4qqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 432191005E64;
	Mon, 21 Sep 2020 20:15:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D588E55773;
	Mon, 21 Sep 2020 20:15:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE99F8C7AA;
	Mon, 21 Sep 2020 20:15:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08LKFnBc009271 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 16:15:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E149C19744; Mon, 21 Sep 2020 20:15:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A14B919C4F;
	Mon, 21 Sep 2020 20:15:46 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08LKFjNE000482; 
	Mon, 21 Sep 2020 15:15:45 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08LKFiqv000481;
	Mon, 21 Sep 2020 15:15:44 -0500
Date: Mon, 21 Sep 2020 15:15:44 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200921201544.GZ11108@octiron.msp.redhat.com>
References: <20200916153718.582-1-mwilck@suse.com>
	<20200916153718.582-20-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200916153718.582-20-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 19/19] mpathpersist: remove logsink and udev
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 16, 2020 at 05:37:18PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> We can use libmultipath's internal symbols now.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  mpathpersist/main.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/mpathpersist/main.c b/mpathpersist/main.c
> index 0f0db4b..729857f 100644
> --- a/mpathpersist/main.c
> +++ b/mpathpersist/main.c

I'm pretty sure that without this patch, mpathpersist is not directly
calling functions from libmultipath, and if so, it should stay that way.
I don't see any problem with adding the libmultipath_init() and
libmultipath_exit() calls to libmpathpersist_init() and
libmpathpersist_exit().

-Ben 

> @@ -42,13 +42,10 @@ void * mpath_alloc_prin_response(int prin_sa);
>  void mpath_print_transport_id(struct prin_fulldescr *fdesc);
>  int construct_transportid(const char * inp, struct transportid transid[], int num_transportids);
>  
> -int logsink;
> -
>  void rcu_register_thread_memb(void) {}
>  
>  void rcu_unregister_thread_memb(void) {}
>  
> -struct udev *udev;
>  
>  static int verbose, loglevel, noisy;
>  
> @@ -608,16 +605,17 @@ int main(int argc, char *argv[])
>  		exit (1);
>  	}
>  
> -	udev = udev_new();
> +	if (libmultipath_init())
> +		exit(1);
>  	if (libmpathpersist_init()) {
> -		udev_unref(udev);
> +		libmultipath_exit();
>  		exit(1);
>  	}
>  
>  	ret = handle_args(argc, argv, 0);
>  
>  	libmpathpersist_exit();
> -	udev_unref(udev);
> +	libmultipath_exit();
>  
>  	return (ret >= 0) ? ret : MPATH_PR_OTHER;
>  }
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

