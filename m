Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B277545CF61
	for <lists+dm-devel@lfdr.de>; Wed, 24 Nov 2021 22:42:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637790146;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kxoq8a9Dkv6LzXZvGpn8NdYkdi2C6hZrYVPnf4tqPro=;
	b=eDO/HRASa21GKVesTsk7qG7jknmg8UG3kJKSVbY6iJCSYNlwOx1qjzoOHudYDTF7zW4Xah
	G/LYcdpjb2bgS1gZ73QoEe6LxovIOlWnFC0rde890J+IkW23nSgx+OqlD1w9gdK1rWQyWB
	RhtH9hC4cFoZpjVhdqJsB0rvRN5fxPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-WN8hzJRYMsO1dH1pnl8tfA-1; Wed, 24 Nov 2021 16:42:23 -0500
X-MC-Unique: WN8hzJRYMsO1dH1pnl8tfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1149835BC3;
	Wed, 24 Nov 2021 21:42:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68ECF5D6CF;
	Wed, 24 Nov 2021 21:42:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 760FA4BB7C;
	Wed, 24 Nov 2021 21:42:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AOLfqPK024230 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Nov 2021 16:41:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9D43760C17; Wed, 24 Nov 2021 21:41:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2367160C05;
	Wed, 24 Nov 2021 21:41:44 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AOLff9J022651; 
	Wed, 24 Nov 2021 15:41:41 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AOLfeV6022650;
	Wed, 24 Nov 2021 15:41:40 -0600
Date: Wed, 24 Nov 2021 15:41:40 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20211124214140.GR19591@octiron.msp.redhat.com>
References: <20211118225840.19810-1-mwilck@suse.com>
	<20211118225840.19810-13-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20211118225840.19810-13-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH v2 12/48] multipathd: add and set
 cli_handlers in a single step
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 18, 2021 at 11:58:04PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Modify set_handler_callback() such that a missing slot is created
> if no matching slot is found. This way, we can skip the initialization
> with NULL handlers on startup. Assigning the same handler multiple
> times would be a bug which is tested with assert().
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipathd/cli.c | 95 ++++++++----------------------------------------
>  multipathd/cli.h |  7 ++--
>  2 files changed, 19 insertions(+), 83 deletions(-)
> 
> diff --git a/multipathd/cli.c b/multipathd/cli.c
> index 5213813..6e5056e 100644
> --- a/multipathd/cli.c
> +++ b/multipathd/cli.c
> @@ -4,6 +4,7 @@
>  #include <sys/time.h>
>  #include <errno.h>
>  #include <pthread.h>
> +#include <assert.h>
>  #include "memory.h"
>  #include "vector.h"
>  #include "structs.h"
> @@ -64,26 +65,26 @@ out:
>  	return 1;
>  }
>  
> -int
> -add_handler (uint64_t fp, cli_handler *fn)
> +static struct handler *add_handler(uint64_t fp, cli_handler *fn, bool locked)
>  {
>  	struct handler * h;
>  
>  	h = alloc_handler();
>  
> -	if (!h)
> -		return 1;
> +	if (h == NULL)
> +		return NULL;
>  
>  	if (!vector_alloc_slot(handlers)) {
>  		FREE(h);
> -		return 1;
> +		return NULL;
>  	}
>  
>  	vector_set_slot(handlers, h);
>  	h->fingerprint = fp;
>  	h->fn = fn;
> +	h->locked = locked;
>  
> -	return 0;
> +	return h;
>  }
>  
>  static struct handler *
> @@ -100,26 +101,17 @@ find_handler (uint64_t fp)
>  }
>  
>  int
> -set_handler_callback (uint64_t fp, cli_handler *fn)
> +__set_handler_callback (uint64_t fp, cli_handler *fn, bool locked)
>  {
> -	struct handler * h = find_handler(fp);
> +	struct handler *h;
>  
> -	if (!h)
> +	assert(find_handler(fp) == NULL);
> +        h = add_handler(fp, fn, locked);
> +        if (!h) {
> +		condlog(0, "%s: failed to set handler for code %"PRIu64,
> +			__func__, fp);
>  		return 1;
> -	h->fn = fn;
> -	h->locked = 1;
> -	return 0;
> -}
> -
> -int
> -set_unlocked_handler_callback (uint64_t fp, cli_handler *fn)
> -{
> -	struct handler * h = find_handler(fp);
> -
> -	if (!h)
> -		return 1;
> -	h->fn = fn;
> -	h->locked = 0;
> +	}
>  	return 0;
>  }
>  
> @@ -513,63 +505,6 @@ cli_init (void) {
>  	if (alloc_handlers())
>  		return 1;
>  
> -	add_handler(LIST+PATHS, NULL);
> -	add_handler(LIST+PATHS+FMT, NULL);
> -	add_handler(LIST+PATHS+RAW+FMT, NULL);
> -	add_handler(LIST+PATH, NULL);
> -	add_handler(LIST+STATUS, NULL);
> -	add_handler(LIST+DAEMON, NULL);
> -	add_handler(LIST+MAPS, NULL);
> -	add_handler(LIST+MAPS+STATUS, NULL);
> -	add_handler(LIST+MAPS+STATS, NULL);
> -	add_handler(LIST+MAPS+FMT, NULL);
> -	add_handler(LIST+MAPS+RAW+FMT, NULL);
> -	add_handler(LIST+MAPS+TOPOLOGY, NULL);
> -	add_handler(LIST+MAPS+JSON, NULL);
> -	add_handler(LIST+TOPOLOGY, NULL);
> -	add_handler(LIST+MAP+TOPOLOGY, NULL);
> -	add_handler(LIST+MAP+JSON, NULL);
> -	add_handler(LIST+MAP+FMT, NULL);
> -	add_handler(LIST+MAP+RAW+FMT, NULL);
> -	add_handler(LIST+CONFIG, NULL);
> -	add_handler(LIST+CONFIG+LOCAL, NULL);
> -	add_handler(LIST+BLACKLIST, NULL);
> -	add_handler(LIST+DEVICES, NULL);
> -	add_handler(LIST+WILDCARDS, NULL);
> -	add_handler(RESET+MAPS+STATS, NULL);
> -	add_handler(RESET+MAP+STATS, NULL);
> -	add_handler(ADD+PATH, NULL);
> -	add_handler(DEL+PATH, NULL);
> -	add_handler(ADD+MAP, NULL);
> -	add_handler(DEL+MAP, NULL);
> -	add_handler(DEL+MAPS, NULL);
> -	add_handler(SWITCH+MAP+GROUP, NULL);
> -	add_handler(RECONFIGURE, NULL);
> -	add_handler(SUSPEND+MAP, NULL);
> -	add_handler(RESUME+MAP, NULL);
> -	add_handler(RESIZE+MAP, NULL);
> -	add_handler(RESET+MAP, NULL);
> -	add_handler(RELOAD+MAP, NULL);
> -	add_handler(DISABLEQ+MAP, NULL);
> -	add_handler(RESTOREQ+MAP, NULL);
> -	add_handler(DISABLEQ+MAPS, NULL);
> -	add_handler(RESTOREQ+MAPS, NULL);
> -	add_handler(REINSTATE+PATH, NULL);
> -	add_handler(FAIL+PATH, NULL);
> -	add_handler(QUIT, NULL);
> -	add_handler(SHUTDOWN, NULL);
> -	add_handler(GETPRSTATUS+MAP, NULL);
> -	add_handler(SETPRSTATUS+MAP, NULL);
> -	add_handler(UNSETPRSTATUS+MAP, NULL);
> -	add_handler(GETPRKEY+MAP, NULL);
> -	add_handler(SETPRKEY+MAP+KEY, NULL);
> -	add_handler(UNSETPRKEY+MAP, NULL);
> -	add_handler(FORCEQ+DAEMON, NULL);
> -	add_handler(RESTOREQ+DAEMON, NULL);
> -	add_handler(SETMARGINAL+PATH, NULL);
> -	add_handler(UNSETMARGINAL+PATH, NULL);
> -	add_handler(UNSETMARGINAL+MAP, NULL);
> -
>  	return 0;
>  }
>  
> diff --git a/multipathd/cli.h b/multipathd/cli.h
> index 3dac1b4..479a745 100644
> --- a/multipathd/cli.h
> +++ b/multipathd/cli.h
> @@ -133,9 +133,10 @@ struct handler {
>  };
>  
>  int alloc_handlers (void);
> -int add_handler (uint64_t fp, cli_handler *fn);
> -int set_handler_callback (uint64_t fp, cli_handler *fn);
> -int set_unlocked_handler_callback (uint64_t fp, cli_handler *fn);
> +int __set_handler_callback (uint64_t fp, cli_handler *fn, bool locked);
> +#define set_handler_callback(fp, fn) __set_handler_callback(fp, fn, true)
> +#define set_unlocked_handler_callback(fp, fn) __set_handler_callback(fp, fn, false)
> +
>  int parse_cmd (char * cmd, char ** reply, int * len, void *, int);
>  int load_keys (void);
>  char * get_keyparam (vector v, uint64_t code);
> -- 
> 2.33.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

