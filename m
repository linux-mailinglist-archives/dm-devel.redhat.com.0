Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 404A040D19D
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 04:19:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631758777;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MD8wSs5WYPKlbL2kE2Oj5QO0jBXRQf0bu7BgeE8hX3s=;
	b=HFjIVA/+yILn6VIzssZozQ+iPzjjL7XgMCcfBXw4a73zDOFHPyn8U9R02GdkUgRex61PYy
	kg5TGRNeBy2MjaYm+GVgj6ZQeufugj8E48a8ccC5nL5Vs0/0tU18fH3xJm6r597/uZ4snA
	qfvkH/qom7vC9rYAtIQb3P47LKtzpBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-gFzYWT5pOmmmEF-3p47J3g-1; Wed, 15 Sep 2021 22:19:35 -0400
X-MC-Unique: gFzYWT5pOmmmEF-3p47J3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20F58362FC;
	Thu, 16 Sep 2021 02:19:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0151B10016FF;
	Thu, 16 Sep 2021 02:19:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 713C64E590;
	Thu, 16 Sep 2021 02:19:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G2JQ6U027809 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 22:19:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F17960C82; Thu, 16 Sep 2021 02:19:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6085060240;
	Thu, 16 Sep 2021 02:19:23 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18G2JLib007357; 
	Wed, 15 Sep 2021 21:19:21 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18G2JKhj007356;
	Wed, 15 Sep 2021 21:19:20 -0500
Date: Wed, 15 Sep 2021 21:19:20 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210916021920.GF3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-21-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-21-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 20/35] multipathd: move uxsock_trigger() to
	uxlsnr.c
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:41:05PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> uxsock_trigger() really belongs into cli.c. I suppose that way back in
> the past there were strong reasons to call this function via a
> pointer. I don't think these reasons are valid any more. Moving
> the function to cli.c allows restructuring the code.
> 
> No functional changes.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/main.c   | 44 +-------------------------------------------
>  multipathd/uxlsnr.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
>  multipathd/uxlsnr.h |  4 +---
>  3 files changed, 44 insertions(+), 48 deletions(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index c6357ef..ec4bcc3 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -1526,48 +1526,6 @@ map_discovery (struct vectors * vecs)
>  	return 0;
>  }
>  
> -int
> -uxsock_trigger (char * str, char ** reply, int * len, bool is_root,
> -		void * trigger_data)
> -{
> -	struct vectors * vecs;
> -	int r;
> -
> -	*reply = NULL;
> -	*len = 0;
> -	vecs = (struct vectors *)trigger_data;
> -
> -	if ((str != NULL) && (is_root == false) &&
> -	    (strncmp(str, "list", strlen("list")) != 0) &&
> -	    (strncmp(str, "show", strlen("show")) != 0)) {
> -		*reply = STRDUP("permission deny: need to be root");
> -		if (*reply)
> -			*len = strlen(*reply) + 1;
> -		return 1;
> -	}
> -
> -	r = parse_cmd(str, reply, len, vecs, uxsock_timeout / 1000);
> -
> -	if (r > 0) {
> -		if (r == ETIMEDOUT)
> -			*reply = STRDUP("timeout\n");
> -		else
> -			*reply = STRDUP("fail\n");
> -		if (*reply)
> -			*len = strlen(*reply) + 1;
> -		r = 1;
> -	}
> -	else if (!r && *len == 0) {
> -		*reply = STRDUP("ok\n");
> -		if (*reply)
> -			*len = strlen(*reply) + 1;
> -		r = 0;
> -	}
> -	/* else if (r < 0) leave *reply alone */
> -
> -	return r;
> -}
> -
>  int
>  uev_trigger (struct uevent * uev, void * trigger_data)
>  {
> @@ -1704,7 +1662,7 @@ uxlsnrloop (void * ap)
>  	       == DAEMON_CONFIGURE)
>  		handle_signals(false);
>  
> -	uxsock_listen(&uxsock_trigger, ux_sock, ap);
> +	uxsock_listen(ux_sock, ap);
>  
>  out_sock:
>  	pthread_cleanup_pop(1); /* uxsock_cleanup */
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index e701a1c..622aac1 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -311,11 +311,51 @@ static void handle_inotify(int fd, struct watch_descriptors *wds)
>  		condlog(1, "Multipath configuration updated.\nReload multipathd for changes to take effect");
>  }
>  
> +static int uxsock_trigger(char *str, char **reply, int *len,
> +			  bool is_root, void *trigger_data)
> +{
> +	struct vectors * vecs;
> +	int r;
> +
> +	*reply = NULL;
> +	*len = 0;
> +	vecs = (struct vectors *)trigger_data;
> +
> +	if ((str != NULL) && (is_root == false) &&
> +	    (strncmp(str, "list", strlen("list")) != 0) &&
> +	    (strncmp(str, "show", strlen("show")) != 0)) {
> +		*reply = STRDUP("permission deny: need to be root");
> +		if (*reply)
> +			*len = strlen(*reply) + 1;
> +		return 1;
> +	}
> +
> +	r = parse_cmd(str, reply, len, vecs, uxsock_timeout / 1000);
> +
> +	if (r > 0) {
> +		if (r == ETIMEDOUT)
> +			*reply = STRDUP("timeout\n");
> +		else
> +			*reply = STRDUP("fail\n");
> +		if (*reply)
> +			*len = strlen(*reply) + 1;
> +		r = 1;
> +	}
> +	else if (!r && *len == 0) {
> +		*reply = STRDUP("ok\n");
> +		if (*reply)
> +			*len = strlen(*reply) + 1;
> +		r = 0;
> +	}
> +	/* else if (r < 0) leave *reply alone */
> +
> +	return r;
> +}
> +
>  /*
>   * entry point
>   */
> -void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
> -		     void * trigger_data)
> +void *uxsock_listen(long ux_sock, void *trigger_data)
>  {
>  	int rlen;
>  	char *inbuf;
> diff --git a/multipathd/uxlsnr.h b/multipathd/uxlsnr.h
> index 18f008d..60c3a2c 100644
> --- a/multipathd/uxlsnr.h
> +++ b/multipathd/uxlsnr.h
> @@ -3,10 +3,8 @@
>  
>  #include <stdbool.h>
>  
> -typedef int (uxsock_trigger_fn)(char *, char **, int *, bool, void *);
> -
>  void uxsock_cleanup(void *arg);
> -void *uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
> +void *uxsock_listen(long ux_sock,
>  		    void * trigger_data);
>  
>  #endif
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

