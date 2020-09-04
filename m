Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A8A3D25E34D
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 23:31:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599255083;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gh4bZsiP/XfBLjQZI7EKrnARTrgSZAlRYPad1WGSiuQ=;
	b=CfGU0f4wvBN6N8pkFUWwioJCateBNPVbgehtKHcgy4amgX69Uu8RZUhKe0r/f/evFlacr8
	gkdNJz1ONXCrA2E9R0ILIxUBduqu5J1Zg4LnsWCp2YGjYoY4i1/38qoJ4X2QF+ZzxlxQV5
	2F6rec4/qAaGNkHOda8+OU34INWs00w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-UjM2j7UUNSKtgMHX87GDMw-1; Fri, 04 Sep 2020 17:31:20 -0400
X-MC-Unique: UjM2j7UUNSKtgMHX87GDMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94A20425E3;
	Fri,  4 Sep 2020 21:31:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 152527F1DE;
	Fri,  4 Sep 2020 21:31:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1631A18561B2;
	Fri,  4 Sep 2020 21:30:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084LUrGO023924 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 17:30:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B3AE57E162; Fri,  4 Sep 2020 21:30:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98D947DFFE;
	Fri,  4 Sep 2020 21:30:50 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 084LUnYU025263; 
	Fri, 4 Sep 2020 16:30:49 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 084LUmVh025262;
	Fri, 4 Sep 2020 16:30:48 -0500
Date: Fri, 4 Sep 2020 16:30:48 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200904213048.GE11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<40cf77df-eaa3-fb72-69fd-9f865d12dc34@huawei.com>
MIME-Version: 1.0
In-Reply-To: <40cf77df-eaa3-fb72-69fd-9f865d12dc34@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 09/14] libmultipath: check whether
 mp->features is NULl in, assemble_map
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 02, 2020 at 03:21:15PM +0800, lixiaokeng wrote:
> In assemble_map func, if add_feature fails and mp->features is
> default value (NULL), STRDUP(mp->features) will cause a seg-fault.
> In addition, f = STRDUP(mp->features) is just used for APPEND().
> We can directly pass mp->features to APPEND().
> 
> Here, we firstly check whether mp->features is null.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/dmparser.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> index 482e9d0e..12182bf5 100644
> --- a/libmultipath/dmparser.c
> +++ b/libmultipath/dmparser.c
> @@ -65,7 +65,7 @@ assemble_map (struct multipath * mp, char * params, int len)
>  	int i, j;
>  	int minio;
>  	int nr_priority_groups, initial_pg_nr;
> -	char * p, * f;
> +	char * p;
>  	const char *const end = params + len;
>  	char no_path_retry[] = "queue_if_no_path";
>  	char retain_hwhandler[] = "retain_attached_hw_handler";
> @@ -86,9 +86,12 @@ assemble_map (struct multipath * mp, char * params, int len)
>  	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0))
>  		add_feature(&mp->features, retain_hwhandler);
> 
> -	f = STRDUP(mp->features);

clearly strdup()ing without checking if mp->features NULL is incorrect.
However, I'm not sure that we need to fail if mp->features is NULL.
instead, int the APPEND call, we could use the gcc ternary operator
extension

(mp->features)?: "0"

to use "0" if mp->features is NULL.

Also, have you seen this actually occur?  Or is this just a theoretical
issue that you've found from reading the code.  It seems like
setup_map() will always call select_features() before calling
assemble_map(), which should mean that mp->features will always be set
in this case. Perhaps I'm missing something here.

-Ben

> +	if (!mp->features) {
> +		condlog(0, "mp->features is still NULL.");
> +		goto err;
> +	}
> 
> -	APPEND(p, end, "%s %s %i %i", f, mp->hwhandler, nr_priority_groups,
> +	APPEND(p, end, "%s %s %i %i", mp->features, mp->hwhandler, nr_priority_groups,
>  	       initial_pg_nr);
> 
>  	vector_foreach_slot (mp->pg, pgp, i) {
> @@ -110,12 +113,10 @@ assemble_map (struct multipath * mp, char * params, int len)
>  		}
>  	}
> 
> -	FREE(f);
>  	condlog(4, "%s: assembled map [%s]", mp->alias, params);
>  	return 0;
> 
>  err:
> -	FREE(f);
>  	return 1;
>  }
> 
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

