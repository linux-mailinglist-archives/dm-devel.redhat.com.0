Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D940840D1AC
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 04:32:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631759523;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B+odOgZ5AFDaf4+E17Fwx7znOyBiogIiYqCiD8wd6/c=;
	b=S9+BvWWLQ6gQSnlECkiTRKPRU8yBfB4Bv2Z5NHUVgANOQ5An+DAIAZ05ae+LpX4mnjlWI2
	iaMn9B4XrTqb0EqSmpw5KrIEtlMsrJTK1uVgF/OJWxkNof0nF6b0OVU5e34/qjeoPwgmUz
	tWKU3y6weymrA4m0+9pFSgyNvqPoFUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-Zp3craPvMQGdk3eof1Twyg-1; Wed, 15 Sep 2021 22:32:02 -0400
X-MC-Unique: Zp3craPvMQGdk3eof1Twyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCE9B802937;
	Thu, 16 Sep 2021 02:31:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DEE71972E;
	Thu, 16 Sep 2021 02:31:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28130180142F;
	Thu, 16 Sep 2021 02:31:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G2SVTN028457 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 22:28:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9DDC71972E; Thu, 16 Sep 2021 02:28:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1B1319C79;
	Thu, 16 Sep 2021 02:28:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18G2SNck007414; 
	Wed, 15 Sep 2021 21:28:23 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18G2SM87007413;
	Wed, 15 Sep 2021 21:28:22 -0500
Date: Wed, 15 Sep 2021 21:28:22 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210916022822.GM3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-28-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-28-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 27/35] multipathd: uxlsnr: pass struct client
 to uxsock_trigger() and parse_cmd()
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

On Fri, Sep 10, 2021 at 01:41:12PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> As a next step towards the state machine, give the handler functions
> access to the state of the client connection.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/uxlsnr.c | 61 +++++++++++++++++++++------------------------
>  1 file changed, 29 insertions(+), 32 deletions(-)
> 
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index 9cf6964..65cb5ca 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -293,31 +293,28 @@ static void handle_inotify(int fd, struct watch_descriptors *wds)
>  
>  static const struct timespec ts_zero = { .tv_sec = 0, };
>  
> -static int parse_cmd (char *cmd, struct strbuf *reply, void *data,
> -		      int timeout)
> +static int parse_cmd (struct client *c, void *data, int timeout)
>  {
>  	int r;
>  	struct handler * h;
> -	vector cmdvec = NULL;
>  	struct timespec tmo;
>  
> -	r = get_cmdvec(cmd, &cmdvec);
> +	r = get_cmdvec(c->cmd, &c->cmdvec);
>  
>  	if (r) {
> -		genhelp_handler(cmd, r, reply);
> -		if (get_strbuf_len(reply) == 0)
> +		genhelp_handler(c->cmd, r, &c->reply);
> +		if (get_strbuf_len(&c->reply) == 0)
>  			return EINVAL;
>  		return 0;
>  	}
>  
> -	h = find_handler_for_cmdvec(cmdvec);
> +	h = find_handler_for_cmdvec(c->cmdvec);
>  
>  	if (!h || !h->fn) {
> -		free_keys(cmdvec);
> -		genhelp_handler(cmd, EINVAL, reply);
> -		if (get_strbuf_len(reply) == 0)
> -			return EINVAL;
> -		return 0;
> +		genhelp_handler(c->cmd, EINVAL, &c->reply);
> +		if (get_strbuf_len(&c->reply) == 0)
> +			r = EINVAL;
> +		goto free_cmdvec;
>  	}
>  
>  	/*
> @@ -342,46 +339,47 @@ static int parse_cmd (char *cmd, struct strbuf *reply, void *data,
>  		if (r == 0) {
>  			locked = 1;
>  			pthread_testcancel();
> -			r = h->fn(cmdvec, reply, data);
> +			r = h->fn(c->cmdvec, &c->reply, data);
>  		}
>  		pthread_cleanup_pop(locked);
>  	} else
> -		r = h->fn(cmdvec, reply, data);
> -	free_keys(cmdvec);
> +		r = h->fn(c->cmdvec, &c->reply, data);
> +
> +free_cmdvec:
> +	free_keys(c->cmdvec);
> +	c->cmdvec = NULL;
>  
>  	return r;
>  }
>  
> -static int uxsock_trigger(char *str, struct strbuf *reply,
> -			  bool is_root, void *trigger_data)
> +static int uxsock_trigger(struct client *c, void *trigger_data)
>  {
>  	struct vectors * vecs;
> -	int r;
> +	int r = 1;
>  
>  	vecs = (struct vectors *)trigger_data;
>  
> -	if ((str != NULL) && (is_root == false) &&
> -	    (strncmp(str, "list", strlen("list")) != 0) &&
> -	    (strncmp(str, "show", strlen("show")) != 0)) {
> -		append_strbuf_str(reply, "permission deny: need to be root");
> -		return 1;
> +
> +	if (!c->is_root &&
> +	    (strncmp(c->cmd, "list", strlen("list")) != 0) &&
> +	    (strncmp(c->cmd, "show", strlen("show")) != 0)) {
> +		append_strbuf_str(&c->reply, "permission deny: need to be root");
> +		return r;
>  	}
>  
> -	r = parse_cmd(str, reply, vecs, uxsock_timeout / 1000);
> +	r = parse_cmd(c, vecs, uxsock_timeout / 1000);
>  
>  	if (r > 0) {
>  		if (r == ETIMEDOUT)
> -			append_strbuf_str(reply, "timeout\n");
> +			append_strbuf_str(&c->reply, "timeout\n");
>  		else
> -			append_strbuf_str(reply, "fail\n");
> -		r = 1;
> +			append_strbuf_str(&c->reply, "fail\n");
>  	}
> -	else if (!r && get_strbuf_len(reply) == 0) {
> -		append_strbuf_str(reply, "ok\n");
> +	else if (!r && get_strbuf_len(&c->reply) == 0) {
> +		append_strbuf_str(&c->reply, "ok\n");
>  		r = 0;
>  	}
>  	/* else if (r < 0) leave *reply alone */
> -
>  	return r;
>  }
>  
> @@ -454,8 +452,7 @@ static void handle_client(struct client *c, void *trigger_data)
>  	}
>  
>  	condlog(4, "cli[%d]: Got request [%s]", c->fd, c->cmd);
> -	uxsock_trigger(c->cmd, &c->reply, _socket_client_is_root(c->fd),
> -		       trigger_data);
> +	uxsock_trigger(c, trigger_data);
>  
>  	if (get_strbuf_len(&c->reply) > 0) {
>  		const char *buf = get_strbuf_str(&c->reply);
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

