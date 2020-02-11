Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id ACBBD158BF1
	for <lists+dm-devel@lfdr.de>; Tue, 11 Feb 2020 10:35:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581413730;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UtUWK4uICyWXaBzb4tp0i1180n8MMxKtCwKZ/tCXVhI=;
	b=cVC6xB8aqL6mtNnUSxvjn1GiUsxBLk6uBZNtH3HMsi9/CBxD8v5VLxYcRhAUmmB2GP9wWu
	3oXOVGSQcT0TzYIyf/j5sizJNpLnjtOWWI6gjG9SK8UaYBa3v+v5IbADgVXIUslutfSU+g
	um0v5+4eTxHSh8te8tJPCWA2cbn02mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-iVSZ9agoOjei3odvQqFf0Q-1; Tue, 11 Feb 2020 04:35:27 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 028DE10054E3;
	Tue, 11 Feb 2020 09:35:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD4B65C21B;
	Tue, 11 Feb 2020 09:35:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0A8818089CE;
	Tue, 11 Feb 2020 09:35:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B9YuYW013104 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 04:34:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 23579206320D; Tue, 11 Feb 2020 09:34:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E2FC206320B
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 09:34:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFA448F3B98
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 09:34:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-216-I5HHj1nhMg2CEn0I1bmLzg-1;
	Tue, 11 Feb 2020 04:34:51 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E247BAAFD;
	Tue, 11 Feb 2020 09:34:49 +0000 (UTC)
Message-ID: <10b549834e581e0ec3b9aba230c2f01c43db6c11.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Tue, 11 Feb 2020 10:36:19 +0100
In-Reply-To: <1580929100-32572-4-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-4-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: I5HHj1nhMg2CEn0I1bmLzg-1
X-MC-Unique: iVSZ9agoOjei3odvQqFf0Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B9YuYW013104
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 03/17] libmultipath: fix leak in foreign
	code
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Ben, hi Christophe,

On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> If scandir fails or finds no foreign libraries, enable_re needs to be
> freed before exitting.
> 
> Fixes: 8d03eda4 'multipath.conf: add "enable_foreign" parameter'
> Reviewed-by: Martin Wilck <mwilck@suse.com>
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/foreign.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

While trying to merge your series into my tree, I realized that this
patch conflicts with my previously submitted patch "libmultipath:
_init_foreign(): fix possible memory leak"
https://www.redhat.com/archives/dm-devel/2019-October/msg00104.html
which fixed the same issue.

The two patches are almost equal, so I really don't care which one
is eventually taken. I just wanted to alert Christophe about the
conflict.

Anyway, I thought that you'd ACK'd my October 72-part patch series in
the following messages:

https://www.redhat.com/archives/dm-devel/2019-October/msg00214.html
  (Ben: ACK on v2 of 72-part series "multipath-tools: cleanup and
warning enablement", except 16/72 "libmultipath: make path_discovery()
pthread_cancel()-safe")
https://www.redhat.com/archives/dm-devel/2019-November/msg00016.html
  (Ben: ACK on 16/72 "libmultipath: make path_discovery()
pthread_cancel()-safe", after discussion)
https://www.redhat.com/archives/dm-devel/2019-November/msg00085.html
  (Ben: Ack on v2->v3 change, updated patch v3 45/72 "libmultipath: fix
-Wsign-compare warnings with snprintf()")

Please clarify if I misunderstood that and the series still needs work
from your PoV.

Regards
Martin


> 
> diff --git a/libmultipath/foreign.c b/libmultipath/foreign.c
> index 4b34e141..68e9a9b8 100644
> --- a/libmultipath/foreign.c
> +++ b/libmultipath/foreign.c
> @@ -129,7 +129,7 @@ static int _init_foreign(const char
> *multipath_dir, const char *enable)
>  	char pathbuf[PATH_MAX];
>  	struct dirent **di;
>  	struct scandir_result sr;
> -	int r, i;
> +	int r, i, ret = 0;
>  	regex_t *enable_re = NULL;
>  
>  	foreigns = vector_alloc();
> @@ -157,13 +157,15 @@ static int _init_foreign(const char
> *multipath_dir, const char *enable)
>  	if (r == 0) {
>  		condlog(3, "%s: no foreign multipath libraries found",
>  			__func__);
> -		return 0;
> +		ret = 0;
> +		goto out;
>  	} else if (r < 0) {
>  		r = errno;
>  		condlog(1, "%s: error %d scanning foreign multipath
> libraries",
>  			__func__, r);
>  		_cleanup_foreign();
> -		return -r;
> +		ret = -r;
> +		goto out;
>  	}
>  
>  	sr.di = di;
> @@ -250,8 +252,9 @@ static int _init_foreign(const char
> *multipath_dir, const char *enable)
>  		free_foreign(fgn);
>  	}
>  	pthread_cleanup_pop(1); /* free_scandir_result */
> +out:
>  	pthread_cleanup_pop(1); /* free_pre */
> -	return 0;
> +	return ret;
>  }
>  
>  int init_foreign(const char *multipath_dir, const char *enable)



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

