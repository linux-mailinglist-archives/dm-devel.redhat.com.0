Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 90EB240D19C
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 04:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631758757;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pdoT5gFSW5omsoUk7cRzmLvr5kvgeGNw8MH5LiLrr0I=;
	b=QlYQewMvx4B1KwwSec52CQjWrajGgYu2s8BLlDK0MY2y30qvyAQibv/fhawcrs+vEhJ51o
	ygMgO5papvHfcm5fh8WCdvHZndIWp9io2mvjf7HnyTwSAj7n5yBzaexGJaseyJX9Z6OGPq
	OeYDmGt6jeCny4biAWEQN98aw2fh/4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-1sk4pKwoPV-zbCrx1cKkqA-1; Wed, 15 Sep 2021 22:19:16 -0400
X-MC-Unique: 1sk4pKwoPV-zbCrx1cKkqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2957810053FB;
	Thu, 16 Sep 2021 02:19:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C354D19C79;
	Thu, 16 Sep 2021 02:19:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 398CA4E58F;
	Thu, 16 Sep 2021 02:19:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G2J7M3027763 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 22:19:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5F4110074FD; Thu, 16 Sep 2021 02:19:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2912910016FF;
	Thu, 16 Sep 2021 02:19:04 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18G2J2g6007350; 
	Wed, 15 Sep 2021 21:19:02 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18G2J1O9007349;
	Wed, 15 Sep 2021 21:19:01 -0500
Date: Wed, 15 Sep 2021 21:19:01 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210916021901.GE3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-20-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-20-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 19/35] multipathd: uxlsnr: data structure for
 stateful client connection
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:41:04PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Currently the uxlsnr handles each client request (receive requset -
> handle request - respond) in a single loop iteration. This has
> severe disadvantages. In particular, the code may wait in poll()
> called from read_all(), or wait for the vecs lock, while other
> clients are ready to be serviced or signals to be handled.
> 
> This patch adds some fields to "struct client" which will be used
> by later patches to change this into a state machine that basically
> waits only in place, the ppoll() call in uxsock_listen().
> 
> For now, we just introduce and initialize the fields.
> 

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/uxlsnr.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index 98a9f71..e701a1c 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -40,10 +40,30 @@
>  #include "main.h"
>  #include "cli.h"
>  #include "uxlsnr.h"
> +#include "strbuf.h"
> +
> +/* state of client connection */
> +enum {
> +	CLT_RECV,
> +	CLT_PARSE,
> +	CLT_WAIT_LOCK,
> +	CLT_WORK,
> +	CLT_SEND,
> +};
>  
>  struct client {
>  	struct list_head node;
> +	struct timespec expires;
> +	int state;
>  	int fd;
> +	vector cmdvec;
> +	/* NUL byte at end */
> +	char cmd[_MAX_CMD_LEN + 1];
> +	struct strbuf reply;
> +	struct handler *handler;
> +	size_t cmd_len, len;
> +	int error;
> +	bool is_root;
>  };
>  
>  /* Indices for array of poll fds */
> @@ -104,14 +124,14 @@ static void new_client(int ux_sock)
>  	if (fd == -1)
>  		return;
>  
> -	c = (struct client *)MALLOC(sizeof(*c));
> +	c = calloc(1, sizeof(*c));
>  	if (!c) {
>  		close(fd);
>  		return;
>  	}
> -	memset(c, 0, sizeof(*c));
>  	INIT_LIST_HEAD(&c->node);
>  	c->fd = fd;
> +	c->state = CLT_RECV;
>  
>  	/* put it in our linked list */
>  	pthread_mutex_lock(&client_lock);
> @@ -127,6 +147,9 @@ static void _dead_client(struct client *c)
>  	int fd = c->fd;
>  	list_del_init(&c->node);
>  	c->fd = -1;
> +	reset_strbuf(&c->reply);
> +	if (c->cmdvec)
> +		free_keys(c->cmdvec);
>  	FREE(c);
>  	close(fd);
>  }
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

