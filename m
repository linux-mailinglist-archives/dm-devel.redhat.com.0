Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 216C427953E
	for <lists+dm-devel@lfdr.de>; Sat, 26 Sep 2020 01:56:24 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601078183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O9a5CNzWOdlNk6GV0nVw6EdVAV5yMg3oT5eJZ4BW56o=;
	b=F2isj9j0NQ8eWzjlg+4vtGXCXUFxqC2l/rvFQ80evLz2n479zpI08MJILpylzfoQ+8nvoU
	8Ue/l/P/jsaZoqh5ZuNt1hNai2X0/CdGlTvFy6BRUti+Ii2CzMt5KOjnkTSh3QQkT1f0wy
	BYbPc6doPZFIGAFL/fCawZmKVygH1AE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-wV0-Y4ZkPLGSJHQitPR1SA-1; Fri, 25 Sep 2020 19:56:20 -0400
X-MC-Unique: wV0-Y4ZkPLGSJHQitPR1SA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3043D10082EA;
	Fri, 25 Sep 2020 23:56:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0AAC5C1BB;
	Fri, 25 Sep 2020 23:56:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2866579DA9;
	Fri, 25 Sep 2020 23:56:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PNu7Ae014025 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 19:56:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E6CC61002C22; Fri, 25 Sep 2020 23:56:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C5951001901;
	Fri, 25 Sep 2020 23:56:05 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08PNu3VI004894; 
	Fri, 25 Sep 2020 18:56:03 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08PNu3TE004893;
	Fri, 25 Sep 2020 18:56:03 -0500
Date: Fri, 25 Sep 2020 18:56:03 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200925235603.GH3384@octiron.msp.redhat.com>
References: <20200924133716.14120-1-mwilck@suse.com>
	<20200924133716.14120-21-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924133716.14120-21-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 20/21] mpathpersist: remove logsink and
	udev
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

On Thu, Sep 24, 2020 at 03:37:15PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> We can use libmultipath's internal symbols now. The libmultipath
> initialization is taken care of by libmpathpersist_init().
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  mpathpersist/main.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/mpathpersist/main.c b/mpathpersist/main.c
> index 278e48f..3c2e657 100644
> --- a/mpathpersist/main.c
> +++ b/mpathpersist/main.c
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
> @@ -641,16 +638,13 @@ int main(int argc, char *argv[])
>  		exit (1);
>  	}
>  
> -	udev = udev_new();
>  	if (libmpathpersist_init()) {
> -		udev_unref(udev);
>  		exit(1);
>  	}
>  
>  	ret = handle_args(argc, argv, 0);
>  
>  	libmpathpersist_exit();
> -	udev_unref(udev);
>  
>  	return (ret >= 0) ? ret : MPATH_PR_OTHER;
>  }
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

