Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 21D9A38B3B4
	for <lists+dm-devel@lfdr.de>; Thu, 20 May 2021 17:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621525811;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g0Sv3NRJhIkxALGuk3X+LJzwL2WyJYaRkagjyHdUZrc=;
	b=CbdNOVTl0oBcPVIXjx3QutgRkeY1O6QHiiiBGKJNk/T3ZYpcTLJ9aF5RR8p6t4Yp8VOaz7
	D7O13R24Mkia+M7JLkDzzmw73SB8GwnkI7H/2bILCFkSGzIbFC6B33KUd55id0bcMqBQjz
	9/6DxKsd91kwFigPoOWYKfvApMr/X8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-BEfnbiWRNnqgUPYSVrbHgw-1; Thu, 20 May 2021 11:50:08 -0400
X-MC-Unique: BEfnbiWRNnqgUPYSVrbHgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5205380006E;
	Thu, 20 May 2021 15:50:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3CE26062F;
	Thu, 20 May 2021 15:49:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD4571800BBE;
	Thu, 20 May 2021 15:49:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14KFepX5021192 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 11:40:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AAB7B36D5; Thu, 20 May 2021 15:40:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FCA560C03;
	Thu, 20 May 2021 15:40:47 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14KFekBa029692; 
	Thu, 20 May 2021 10:40:46 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14KFejOc029690;
	Thu, 20 May 2021 10:40:45 -0500
Date: Thu, 20 May 2021 10:40:45 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210520154045.GP25887@octiron.msp.redhat.com>
References: <20210517212727.25229-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210517212727.25229-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] [PATCH v2 1/4] multipathd: cli_handlers: cleanup
 setting reply length
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 17, 2021 at 11:27:24PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Create a macro for setting the reply length for string literals
> correctly, and use it where necessary.
> 
> In cli_del_path(), don't change the function's return code
> if just the buffer allocation for the reply failed.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipathd/cli_handlers.c | 33 ++++++++++++---------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)
> 
> diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
> index 6765fcf..9606494 100644
> --- a/multipathd/cli_handlers.c
> +++ b/multipathd/cli_handlers.c
> @@ -32,6 +32,12 @@
>  #include "foreign.h"
>  #include "cli_handlers.h"
>  
> +#define SET_REPLY_AND_LEN(__rep, __len, string_literal)			\
> +	do {								\
> +		*(__rep) = strdup(string_literal);			\
> +		*(__len) = *(__rep) ? sizeof(string_literal) : 0;	\
> +	} while (0)
> +
>  int
>  show_paths (char ** r, int * len, struct vectors * vecs, char * style,
>  	    int pretty)
> @@ -802,8 +808,7 @@ cli_add_path (void * v, char ** reply, int * len, void * data)
>  	}
>  	return ev_add_path(pp, vecs, 1);
>  blacklisted:
> -	*reply = strdup("blacklisted\n");
> -	*len = strlen(*reply) + 1;
> +	SET_REPLY_AND_LEN(reply, len, "blacklisted\n");
>  	condlog(2, "%s: path blacklisted", param);
>  	return 0;
>  }
> @@ -824,23 +829,10 @@ cli_del_path (void * v, char ** reply, int * len, void * data)
>  		return 1;
>  	}
>  	ret = ev_remove_path(pp, vecs, 1);
> -	if (ret == REMOVE_PATH_DELAY) {
> -		*reply = strdup("delayed\n");
> -		if (*reply)
> -			*len = strlen(*reply) + 1;
> -		else {
> -			*len = 0;
> -			ret = REMOVE_PATH_FAILURE;
> -		}
> -	} else if (ret == REMOVE_PATH_MAP_ERROR) {
> -		*reply = strdup("map reload error. removed\n");
> -		if (*reply)
> -			*len = strlen(*reply) + 1;
> -		else {
> -			*len = 0;
> -			ret = REMOVE_PATH_FAILURE;
> -		}
> -	}
> +	if (ret == REMOVE_PATH_DELAY)
> +		SET_REPLY_AND_LEN(reply, len, "delayed\n");
> +	else if (ret == REMOVE_PATH_MAP_ERROR)
> +		SET_REPLY_AND_LEN(reply, len, "map reload error. removed\n");
>  	return (ret == REMOVE_PATH_FAILURE);
>  }
>  
> @@ -865,8 +857,7 @@ cli_add_map (void * v, char ** reply, int * len, void * data)
>  		invalid = 1;
>  	pthread_cleanup_pop(1);
>  	if (invalid) {
> -		*reply = strdup("blacklisted\n");
> -		*len = strlen(*reply) + 1;
> +		SET_REPLY_AND_LEN(reply, len, "blacklisted\n");
>  		condlog(2, "%s: map blacklisted", param);
>  		return 1;
>  	}
> -- 
> 2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

